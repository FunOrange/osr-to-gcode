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
tablet_area_width_mm = 16
tablet_area_height_mm = 9

gcode_tablet_origin_x = 90
gcode_tablet_origin_y = 176
gcode_tablet_z = 14

repeat_count = 4

# for converting beatmap object positions to gcode
speed_factor = 2 # move to next object 2x faster than theoretically necessary
wait_factor = 0 # wait longer or shorter than theoretically necessary

# these need to be adjusted depending on the orientation you place the tablet on the printer
flip_axis_x = False
flip_axis_y = True

# don't touch these
osu_min_x = -170.66666666666666
osu_min_y = -56
osu_max_x = 682.2222
osu_max_y = 423.5555

# coordinate transform functions
def osu_x_to_mm(x):
  # convert from osu coordinate to screen coordinate [0.0, 1.0]
  osu_width = osu_max_x - osu_min_x
  screenNormalizedX = (x - osu_min_x) / osu_width
  # multiply normalized value by tablet area width
  return screenNormalizedX * tablet_area_width_mm

def osu_y_to_mm(y):
  # convert from osu coordinate to screen coordinate [0.0, 1.0]
  osu_height = osu_max_y - osu_min_y
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
  f.write(f'G4 P2000 ; wait\n')
  # move to first cursor position
  f.write(f'G1 X{initial_x:.3f} Y{initial_y:.3f} F2000 ; move nozzle to first object\n')
  f.write(f'G4 P2000 ; wait\n')
  f.write('\n')
  f.write('; GET READY TO UNPAUSE HERE!!!!\n')
  f.write('M300 S262 P50\n') # beep
  f.write('G4 P450\n')
  f.write('M300 S328 P50\n') # beep
  f.write('G4 P450\n')
  f.write('M300 S393 P50\n') # beep
  f.write('G4 P450\n')
  f.write('M300 S524 P10\n') # beep!
  f.write('; UNPAUSE!!!\n')
  f.write('\n')
  f.write('; START MAP\n')
  f.write('\n')

def print_and_write(f, s):
  print(s.rstrip())
  f.write(s)


def create_gcode_from_replay(output_file, replay):
  with open(output_file, 'w+') as f:
    # header gcode
    with open('header.gcode') as headerfile:
      f.writelines(headerfile.readlines())

    f.write('G1 Z20 ; raise nozzle before travelling to tablet\n')
    f.write(f'G1 X{gcode_tablet_origin_x:.3f} Y{gcode_tablet_origin_y:.3f} F2000 ; move to tablet origin\n')
    f.write(f'G1 Z{gcode_tablet_z} ; lower nozzle to tablet\n')

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
  with open(output_file, 'w+') as f:
    # header gcode
    with open('header.gcode') as headerfile:
      f.writelines(headerfile.readlines())

    f.write('G1 Z20 ; raise nozzle before travelling to tablet\n')
    f.write(f'G1 X{gcode_tablet_origin_x:.3f} Y{gcode_tablet_origin_y:.3f} F2000 ; move to tablet origin\n')
    f.write(f'G1 Z{gcode_tablet_z} ; lower nozzle to tablet\n')

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
      for hit_object in circles_and_sliders[1:]:
        x = osu_x_to_gcode_mm(hit_object.point.x)
        y = osu_y_to_gcode_mm(hit_object.point.y)
        time = hit_object.time

        delta_x = x - previous_x
        delta_y = y - previous_y
        delta_t = hit_object.time - previous_time
        distance = math.sqrt(delta_x*delta_x + delta_y*delta_y) # WARNING: advanced math
        speed = speed_factor * distance / delta_t # units: mm/ms
        wait_time = wait_factor * delta_t / speed_factor
        if distance < 0.01:
          if hit_object.type & HitObjectType.CIRCLE:
            comment = f'; wait on circle'
          elif hit_object.type & HitObjectType.SLIDER:
            comment = f'; wait on slider'
          f.write(f'G4 F{delta_t:.1f} {comment}\n') # F units: mm/minute (multiply by 60000 to do conversion)
        elif wait_time < 0.01:
          if hit_object.type & HitObjectType.CIRCLE:
            comment1 = f'; move to circle'
            comment2 = f'; wait on circle'
          elif hit_object.type & HitObjectType.SLIDER:
            comment1 = f'; move to slider'
            comment2 = f'; wait on slider'
          f.write(f'G1 X{x:.3f} Y{y:.3f} F{clamp(speed * 60000, 0, 20000):.1f} {comment1}\n') # F units: mm/minute (multiply by 60000 to do conversion)
          f.write(f'G4 F{wait_time:.1f} {comment2}\n') # F units: mm/minute (multiply by 60000 to do conversion)

        previous_x = x
        previous_y = y
        previous_time = time

    # footer gcode
    with open('footer.gcode') as footerfile:
      f.writelines(footerfile.readlines())

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