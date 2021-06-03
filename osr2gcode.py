import os
import sys
import time
from osrparse import parse_replay_file

if len(sys.argv) <= 1:
  # list .osr files in current directory
  # ask the user to select a file
  osrFiles = [f for f in os.listdir() if f.endswith('.osr')]
  print('.osr files in current directory:')
  i = 0
  for file in osrFiles: 
    print(f'{i} - {file}')
    i += 1
  index = int(input('Please choose an .osr file to convert (enter a number): '))
  print(f'You chose: {osrFiles[index]}')
  replay = parse_replay_file(osrFiles[index])
else:
  replay = parse_replay_file(sys.argv[1])

# parameters for conversion from osu coordinates to 3d printer coordinates
tablet_area_width_mm = 100 # TODO
tablet_area_height_mm = 100 # TODO

gcode_tablet_origin_x = 100 # TODO 
gcode_tablet_origin_y = 100 # TODO 

flip_axis_x = False
flip_axis_y = True

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

for event in replay.play_data[3:]:
  keys = '{0:04b}'.format(event.keys)
  print(f'Δ{event.time_delta}ms \tx: {event.x:.2f} \ty: {event.y:.2f} \tkeys: {keys} \tgcode_x: {osu_x_to_gcode_mm(event.x):.2f} \t gcode_y: {osu_y_to_gcode_mm(event.y):.2f}')
  time.sleep(10/1000)

print('done')