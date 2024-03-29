import os
import sys
import time
import math
from osrparse import parse_replay_file
from osureader.reader import BeatmapParser
from osureader.beatmap import Beatmap
from osureader.objects import HitObjectType

def clamp(num, min_value, max_value):
  return max(min(num, max_value), min_value)

##########
# CONFIG #
##########
max_printer_travel_speed_mm_per_sec = 180

# parameters for conversion from osu coordinates to 3d printer coordinates
y_compensation_factor = 1.05
tablet_area_width_mm = 8
tablet_area_height_mm = 4.5 * y_compensation_factor

gcode_tablet_origin_x = 80
gcode_tablet_origin_y = 175
gcode_tablet_z = 14.5
tap_height = 0.5 

repeat_count = 1

initial_delay = 1850
speed_factor = 1.01
faster = 50

# these need to be adjusted depending on the orientation you place the tablet on the printer
flip_axis_x = False
flip_axis_y = True

# don't touch these
osu_min_x = -170.66666666666666
osu_min_y = -56
osu_max_x = 682.2222
osu_max_y = 423.5555
osu_width = osu_max_x - osu_min_x
osu_height = osu_max_y - osu_min_y

# coordinate transform functions
def osu_x_to_mm(x):
  # convert from osu coordinate to screen coordinate [0.0, 1.0]
  screenNormalizedX = (x - osu_min_x) / osu_width
  # multiply normalized value by tablet area width
  return screenNormalizedX * tablet_area_width_mm

def osu_y_to_mm(y):
  # convert from osu coordinate to screen coordinate [0.0, 1.0]
  screenNormalizedY = (y - osu_min_y) / osu_height
  # multiply normalized value by tablet area height
  return screenNormalizedY * tablet_area_height_mm

def osu_x_to_gcode_mm(x):
  if flip_axis_x:
    return gcode_tablet_origin_x - osu_x_to_mm(x)
  else:
    return gcode_tablet_origin_x + osu_x_to_mm(x)

def osu_y_to_gcode_mm(y):
  if flip_axis_y:
    return gcode_tablet_origin_y - osu_y_to_mm(y)
  else:
    return gcode_tablet_origin_y + osu_y_to_mm(y)

max_printer_travel_speed_mm_per_min = 60 * max_printer_travel_speed_mm_per_sec

def pre_beatmap_gcode(f, initial_x, initial_y):
  # move cursor to song button
  menu_button_x = osu_x_to_gcode_mm(osu_min_x + osu_width * 1)
  menu_button_y = osu_y_to_gcode_mm(osu_min_y + osu_height * 0.52)
  skip_button_x = osu_x_to_gcode_mm(osu_min_x + osu_width * 0.95)
  skip_button_y = osu_y_to_gcode_mm(osu_min_y + osu_height * 0.95)
  # f.write(f'G1 X{asdfx:.3f} Y{asdfy:.3f} F2000 ; move nozzle to middle left of screen\n')
  # f.write(f'G4 P5000 ; wait\n')
  f.write(f'G1 X{menu_button_x:.3f} Y{menu_button_y:.3f} F6000 ; move nozzle on top of start song button\n')
  # f.write(f'G4 P10000 ; wait\n')
  f.write(f'G1 Z{gcode_tablet_z} ; lower nozzle to tablet\n')
  # f.write(f'M300 S524 P100 ; beep\n')
  f.write(f'G1 Z{gcode_tablet_z-tap_height:.2f} F9000 ; tap press\n')
  f.write(f'G1 Z{gcode_tablet_z:.2f} F9000 ; tap release\n')
  # f.write(f'G4 P500 ; wait\n')
  # f.write(f'G1 X{skip_button_x:.3f} Y{skip_button_y:.3f} F2000 ; move nozzle to skip button \n')
  # f.write(f'G1 Z{gcode_tablet_z-tap_height:.2f} F9000 ; tap press\n')
  # f.write(f'G1 Z{gcode_tablet_z:.2f} F9000 ; tap release\n')
  # f.write(f'G4 P500 ; wait\n')
  f.write(f'G1 X{initial_x:.3f} Y{initial_y:.3f} F9000 ; move to first hit object in the map\n')
  f.write(f'G4 P{initial_delay} ; wait until first object\n')
  f.write('; START MAP\n')
  f.write('\n')

def print_and_write(f, s):
  # print(s.rstrip())
  f.write(s)


def create_gcode_from_replay(output_file, replay):
  with open(output_file, 'w+') as f:
    # header gcode
    with open('header.gcode') as headerfile:
      f.writelines(headerfile.readlines())

    f.write('G1 Z20 ; raise nozzle before travelling to tablet\n')

    # pre beatmap gcode
    first_event = replay.play_data[3]
    initial_x = osu_x_to_gcode_mm(first_event.x)
    initial_y = osu_y_to_gcode_mm(first_event.y)
    pre_beatmap_gcode(f, initial_x, initial_y)

    # main beatmap gcode
    previous_x = initial_x
    previous_y = initial_y
    speeds = []
    for event in replay.play_data[4:]: # skip first 4 events (first 3 are garbage, 4th is initial position)
      x = osu_x_to_gcode_mm(event.x)
      y = osu_y_to_gcode_mm(event.y)
      delta_x = x - previous_x
      delta_y = y - previous_y
      distance = math.sqrt(delta_x*delta_x + delta_y*delta_y) # WARNING: advanced math
      if distance > 0 and event.time_delta > 0:
        speed = distance / event.time_delta # units: mm/ms
        speeds.append(speed * 60000)
        print_and_write(f, f'G1 X{x:.2f} Y{y:.2f} F{clamp(speed * 60000, 0, 20000):.2f}\n') # F units: mm/minute (multiply by 60000 to do conversion)
      else:
        f.write(f'G4 P{event.time_delta}\n') # just wait
      previous_x = x
      previous_y = y
    
    # footer gcode
    with open('footer.gcode') as footerfile:
      f.writelines(footerfile.readlines())

def create_gcode_from_beatmap(output_file, beatmap):
  with open('buffer.txt', 'w+') as f:
    # header gcode
    with open('header.gcode') as headerfile:
      f.writelines(headerfile.readlines())

    f.write('G1 Z20 ; raise nozzle before travelling to tablet\n')

    circles_and_sliders = [o for o in beatmap.hit_objects if o.type & HitObjectType.CIRCLE or o.type & HitObjectType.SLIDER]

    # pre beatmap gcode
    first_object = circles_and_sliders[0]
    initial_x = osu_x_to_gcode_mm(first_object.point.x)
    initial_y = osu_y_to_gcode_mm(first_object.point.y)
    for _ in range(repeat_count):
      pre_beatmap_gcode(f, initial_x, initial_y)

      # main beatmap gcode
      previous_x = initial_x
      previous_y = initial_y
      previous_time = first_object.time
      combo = 2
      for hit_object in circles_and_sliders[1:]:
        if hit_object.type & HitObjectType.NEW_COMBO:
          combo = 1
        if hit_object.type & HitObjectType.SLIDER:
          slider = "===D"
        else:
          slider = ""
        x = osu_x_to_gcode_mm(hit_object.point.x)
        y = osu_y_to_gcode_mm(hit_object.point.y)
        time = hit_object.time

        delta_x = x - previous_x
        delta_y = y - previous_y
        delta_t = hit_object.time - previous_time
        distance = math.sqrt(delta_x*delta_x + delta_y*delta_y) # WARNING: advanced math
        speed = distance / delta_t # units: mm/ms
        speed *= 60000 # units: mm/minute (multiply by 60000 to do conversion)
        speed *= speed_factor # units: mm/minute (multiply by 60000 to do conversion)
        if combo == 1:
          print_and_write(f, '\n')
        if distance < 0.01:
          # just wait
          print_and_write(f, f'G4 P{delta_t:.1f} ; ({combo}) stationary\n')
        else:
          if True:
            # move
            print_and_write(f, f'G1 X{x:.3f} Y{y:.3f} F{speed} ; ({combo}){slider} distance: {distance:.2f}mm\n') # F units: mm/minute 
            # then wait
            # wait_time = clamp(delta_t - faster, 0, 9999999999)
            # print_and_write(f, f'{f"G4 P{wait_time:.1f}".ljust(26)} ; ({combo}){slider}\n')
          elif False:
            # move
            print_and_write(f, f'G1 X{x:.3f} Y{y:.3f} F{16000} ; ({combo}){slider} distance: {distance:.2f}mm, speed: {speed:.1f}mm/min\n') # F units: mm/minute 
            # then wait
            wait_time = clamp(delta_t - faster, 0, 9999999999)
            print_and_write(f, f'{f"G4 P{wait_time:.1f}".ljust(26)} ; ({combo}){slider}\n')

        previous_x = x
        previous_y = y
        previous_time = time
        combo += 1

    # footer gcode
    with open('footer.gcode') as footerfile:
      f.writelines(footerfile.readlines())
    
  # write from buffer to actual file
  with open('buffer.txt', 'r') as f:
    # with open(output_file, 'w') as f2:
    #   f2.writelines(f.readlines())
    # return
    if os.path.isfile(output_file):
      # 1. read existing contents into memory
      with open(output_file, 'r') as f2:
        existing_lines = f2.readlines()
      # 2. make backup
      with open(output_file + '.bak', 'w') as f3:
        f3.writelines(existing_lines)
      # 3. write back lines with selective replace
      with open(output_file, 'w') as f2:
        line = 0
        for l1, l2 in zip(f.readlines(), existing_lines):
          line += 1
          if l1 != l2:
            if 'LOCK' in l2:
              print(f'keeping locked line {line}: {l2.rstrip()}')
              f2.write(l2) # write back old line
            else:
              f2.write(l1) # write new line
          else:
            f2.write(l2) # write back old line
    else:
      with open(output_file, 'w+') as f2:
        f2.writelines(f.readlines())

  # os.remove('buffer.txt')
      

def main():
  if len(sys.argv) <= 1:
    # list .osr files in current directory
    # ask the user to select a file
    inputFiles = [f for f in os.listdir() if f.endswith('.osr') or f.endswith('.osu')]
    print('.osr/.osu files in current directory:')
    i = 0
    for file in inputFiles: 
      print(f'{i} - {file}')
      i += 1
    index = int(input('Please choose an .osr file to convert (enter a number): '))
    input_file = inputFiles[index]
    print(f'You chose: {input_file}')
  else:
    input_file = sys.argv[1]

  # create gcode
  output_file = os.path.splitext(input_file)[0] + '.gcode'
  if input_file.endswith('.osr'):
    replay = parse_replay_file(input_file)
    create_gcode_from_replay(output_file, replay)
  elif input_file.endswith('.osu'):
    reader = BeatmapParser()
    beatmap = Beatmap(reader.parse(input_file))
    create_gcode_from_beatmap(output_file, beatmap)
  
  # print replay file
  # for event in replay.play_data[3:]:
  #   keys = '{0:04b}'.format(event.keys)
  #   print(f'x: {event.x:.2f} \ty: {event.y:.2f} \tΔ{event.time_delta}ms \tkeys: {keys}')
  #   time.sleep(1/1000)

  print('done')

if __name__ == '__main__':
  main()