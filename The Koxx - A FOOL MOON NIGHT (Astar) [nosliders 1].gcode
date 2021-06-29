; generated by PrusaSlicer 2.3.1+win64 on 2021-06-03 at 01:08:08 UTC

; 

; external perimeters extrusion width = 0.45mm
; perimeters extrusion width = 0.45mm
; infill extrusion width = 0.45mm
; solid infill extrusion width = 0.45mm
; top infill extrusion width = 0.40mm
; first layer extrusion width = 0.42mm

M73 P0 R0 ; set progress
M73 Q0 S0 ; set progress
M201 X2000 Y2000 Z200 E5000 ; sets maximum accelerations, mm/sec^2
M203 X200 Y200 Z12 E120 ; sets maximum feedrates, mm/sec
M204 P1250 R1250 T1250 ; sets acceleration (P, T) and retract acceleration (R), mm/sec^2
M205 X8.00 Y8.00 Z0.40 E4.50 ; sets the jerk limits, mm/sec
M205 S0 T0 ; sets the minimum extruding and travel feed rate, mm/sec
M107 ; fan off
;TYPE:Custom
M862.3 P "MK3S" ; printer model check
M862.1 P0.4 ; nozzle diameter check
M115 U3.9.2 ; tell printer latest fw version
G90 ; use absolute coordinates
M83 ; extruder relative mode
G28 W ; home all without mesh bed level
G1 X0 Y0 F1000.0 ; go outside print area

; Don't change E values below. Excessive value can damage the printer.

M907 E538 ; set extruder motor current
G21 ; set units to millimeters
G90 ; use absolute coordinates
M83 ; use relative distances for extrusion
;LAYER_CHANGE
;Z:0.2
;HEIGHT:0.2
;BEFORE_LAYER_CHANGE
;0.2

; --------------------- HEADER END ---------------------

G1 Z20 ; raise nozzle before travelling to tablet
G1 X88.000 Y172.750 F12000 ; move nozzle on top of start song button
G1 Z14.5 ; lower nozzle to tablet
G1 Z14.00 F9000 ; tap press
G1 Z14.50 F9000 ; tap release
G4 P500 ; wait
G1 X87.600 Y170.725 F2000 ; move nozzle to skip button 
G1 Z14.00 F9000 ; tap press
G1 Z14.50 F9000 ; tap release
G4 P500 ; wait
G1 X82.633 Y174.212 F2000 ; move to first hit object in the map
G4 P1700.0 ; wait until first object
; START MAP


G1 X82.070 Y174.062 F12000
G4 P370.0 ; distance: 0.58mm, speed: 161.1mm/min
G1 X85.597 Y171.960 F12000
G4 P371.0 ; distance: 4.11mm, speed: 1132.6mm/min
G1 X84.368 Y171.950 F12000
G4 P153.0 ; distance: 1.23mm, speed: 679.5mm/min
G1 X83.814 Y171.500 F12000
G4 P45.0 ; distance: 0.71mm, speed: 785.6mm/min
G1 X84.237 Y171.275 F12000
G4 P45.0 ; distance: 0.48mm, speed: 526.7mm/min
G1 X84.480 Y173.095 F12000
G4 P153.0 ; distance: 1.84mm, speed: 1015.7mm/min

G1 X82.445 Y171.387 F12000
G4 P154.0 ; distance: 2.66mm, speed: 1462.6mm/min
G1 X82.567 Y171.228 F12000
G4 P44.0 ; distance: 0.20mm, speed: 223.1mm/min

G1 X82.398 Y172.166 F12000
G4 P154.0 ; distance: 0.95mm, speed: 524.8mm/min
G1 X81.957 Y172.729 F12000
G4 P44.0 ; distance: 0.72mm, speed: 794.5mm/min

G1 X82.783 Y173.048 F12000
G4 P154.0 ; distance: 0.88mm, speed: 487.1mm/min
G1 X83.364 Y172.842 F12000
G4 P45.0 ; distance: 0.62mm, speed: 679.4mm/min

G1 X83.702 Y173.761 F12000
G4 P153.0 ; distance: 0.98mm, speed: 541.7mm/min
G1 X84.330 Y174.033 F12000
G4 P45.0 ; distance: 0.68mm, speed: 754.0mm/min

G1 X83.270 Y173.977 F12000
G4 P153.0 ; distance: 1.06mm, speed: 587.0mm/min
G1 X82.576 Y174.118 F12000
G4 P45.0 ; distance: 0.71mm, speed: 779.7mm/min

G1 X82.529 Y173.264 F12000
G4 P153.0 ; distance: 0.86mm, speed: 472.9mm/min
G1 X83.214 Y171.932 F12000
G4 P45.0 ; distance: 1.50mm, speed: 1649.3mm/min

G1 X83.139 Y172.879 F12000
G4 P153.0 ; distance: 0.95mm, speed: 525.7mm/min
G1 X82.614 Y171.603 F12000
G4 P45.0 ; distance: 1.38mm, speed: 1519.3mm/min

G1 X83.664 Y171.528 F12000
G4 P153.0 ; distance: 1.05mm, speed: 582.4mm/min
G1 X84.227 Y171.143 F12000
G4 P45.0 ; distance: 0.68mm, speed: 750.5mm/min

G1 X84.133 Y172.194 F12000
G4 P153.0 ; distance: 1.06mm, speed: 583.5mm/min
G1 X84.499 Y172.776 F12000
G4 P45.0 ; distance: 0.69mm, speed: 756.6mm/min

G1 X83.749 Y172.785 F12000
G4 P153.0 ; distance: 0.75mm, speed: 415.0mm/min
G1 X83.045 Y172.457 F12000
G4 P45.0 ; distance: 0.78mm, speed: 854.7mm/min

G1 X82.248 Y172.457 F12000
G4 P154.0 ; distance: 0.80mm, speed: 438.9mm/min
G1 X82.801 Y173.264 F12000
G4 P44.0 ; distance: 0.98mm, speed: 1087.2mm/min

G1 X82.492 Y173.048 F12000
G4 P154.0 ; distance: 0.38mm, speed: 207.7mm/min
G1 X83.486 Y173.151 F12000
G4 P44.0 ; distance: 1.00mm, speed: 1110.7mm/min

G1 X83.083 Y174.062 F12000
G4 P154.0 ; distance: 1.00mm, speed: 548.0mm/min
G1 X82.436 Y174.249 F12000
G4 P44.0 ; distance: 0.67mm, speed: 748.7mm/min

G1 X83.486 Y174.343 F12000
G4 P154.0 ; distance: 1.05mm, speed: 580.6mm/min
G1 X84.105 Y174.015 F12000
G4 P44.0 ; distance: 0.70mm, speed: 778.7mm/min

G1 X85.024 Y173.818 F12000
G4 P154.0 ; distance: 0.94mm, speed: 517.5mm/min
G1 X84.659 Y174.381 F12000
G4 P45.0 ; distance: 0.67mm, speed: 739.2mm/min

G1 X84.856 Y173.358 F12000
G4 P153.0 ; distance: 1.04mm, speed: 576.0mm/min
G1 X85.372 Y172.879 F12000
G4 P45.0 ; distance: 0.70mm, speed: 774.7mm/min

G1 X85.165 Y171.960 F12000
G4 P153.0 ; distance: 0.94mm, speed: 521.2mm/min
G1 X85.756 Y171.622 F12000
G4 P45.0 ; distance: 0.68mm, speed: 749.4mm/min

G1 X84.696 Y171.678 F12000
G4 P153.0 ; distance: 1.06mm, speed: 587.0mm/min
G1 X84.302 Y171.125 F12000
G4 P45.0 ; distance: 0.68mm, speed: 748.1mm/min

G1 X83.242 Y171.078 F12000
G4 P153.0 ; distance: 1.06mm, speed: 586.7mm/min
G1 X82.558 Y170.927 F12000
G4 P45.0 ; distance: 0.70mm, speed: 771.7mm/min

G1 X82.529 Y171.866 F12000
G4 P153.0 ; distance: 0.94mm, speed: 519.1mm/min
G1 X83.083 Y172.297 F12000
G4 P45.0 ; distance: 0.70mm, speed: 772.7mm/min

G1 X82.032 Y172.194 F12000
G4 P153.0 ; distance: 1.06mm, speed: 583.7mm/min
G1 X81.610 Y172.748 F12000
G4 P45.0 ; distance: 0.70mm, speed: 766.4mm/min
G4 P109.0 ; (3) stationary
G1 X81.713 Y173.395 F12000
G4 P44.0 ; distance: 0.66mm, speed: 728.5mm/min

G1 X82.689 Y174.080 F12000
G4 P45.0 ; distance: 1.19mm, speed: 1312.3mm/min
G4 P109.0 ; (2) stationary
G1 X83.580 Y174.052 F12000
G4 P153.0 ; distance: 0.89mm, speed: 493.0mm/min
G1 X84.330 Y174.287 F12000
G4 P45.0 ; distance: 0.79mm, speed: 865.5mm/min
G1 X84.462 Y173.790 F12000
G4 P45.0 ; distance: 0.51mm, speed: 566.3mm/min
G1 X84.011 Y172.767 F12000
G4 P44.0 ; distance: 1.12mm, speed: 1241.7mm/min

G1 X83.918 Y171.866 F12000
G4 P154.0 ; distance: 0.91mm, speed: 498.6mm/min
G1 X84.537 Y171.509 F12000
G4 P44.0 ; distance: 0.71mm, speed: 793.8mm/min

G1 X83.430 Y171.575 F12000
G4 P154.0 ; distance: 1.11mm, speed: 610.3mm/min
G1 X82.755 Y171.340 F12000
G4 P45.0 ; distance: 0.71mm, speed: 787.1mm/min

G1 X81.835 Y171.012 F12000
G4 P153.0 ; distance: 0.98mm, speed: 539.8mm/min
G1 X81.713 Y171.706 F12000
G4 P45.0 ; distance: 0.71mm, speed: 776.2mm/min

G1 X81.723 Y172.767 F12000
G4 P153.0 ; distance: 1.06mm, speed: 586.4mm/min
G1 X82.332 Y174.099 F12000
G4 P45.0 ; distance: 1.47mm, speed: 1613.2mm/min

G1 X82.379 Y173.048 F12000
G4 P153.0 ; distance: 1.05mm, speed: 581.8mm/min
G1 X81.854 Y173.489 F12000
G4 P45.0 ; distance: 0.69mm, speed: 755.1mm/min

G1 X82.764 Y173.592 F12000
G4 P153.0 ; distance: 0.92mm, speed: 506.4mm/min
G1 X84.030 Y172.785 F12000
G4 P45.0 ; distance: 1.50mm, speed: 1653.1mm/min

G1 X83.111 Y172.898 F12000
G4 P153.0 ; distance: 0.93mm, speed: 512.1mm/min
G1 X84.424 Y173.377 F12000
G4 P45.0 ; distance: 1.40mm, speed: 1538.7mm/min

G1 X84.152 Y172.363 F12000
G4 P153.0 ; distance: 1.05mm, speed: 580.3mm/min
G1 X84.696 Y171.171 F12000
G4 P45.0 ; distance: 1.31mm, speed: 1442.2mm/min

G1 X84.706 Y171.903 F12000
G4 P153.0 ; distance: 0.73mm, speed: 404.8mm/min
G1 X83.421 Y172.091 F12000
G4 P45.0 ; distance: 1.30mm, speed: 1429.7mm/min

G1 X84.471 Y172.035 F12000
G4 P154.0 ; distance: 1.05mm, speed: 579.1mm/min
G1 X85.175 Y172.429 F12000
G4 P44.0 ; distance: 0.81mm, speed: 896.0mm/min

G1 X85.437 Y171.903 F12000
G4 P154.0 ; distance: 0.59mm, speed: 323.4mm/min
G1 X86.159 Y171.922 F12000
G4 P44.0 ; distance: 0.72mm, speed: 802.8mm/min

G1 X86.150 Y172.889 F12000
G4 P154.0 ; distance: 0.97mm, speed: 532.1mm/min
G1 X85.409 Y173.198 F12000
G4 P44.0 ; distance: 0.80mm, speed: 892.3mm/min

G1 X85.409 Y174.165 F12000
G4 P154.0 ; distance: 0.97mm, speed: 532.0mm/min
G1 X85.925 Y173.686 F12000
G4 P44.0 ; distance: 0.70mm, speed: 781.9mm/min
G1 X86.056 Y173.818 F12000
G4 P46.0 ; distance: 0.19mm, speed: 202.6mm/min
G1 X86.094 Y173.564 F12000
G4 P0.0 ; distance: 0.26mm, speed: 569.2mm/min
G1 X86.056 Y173.818 F12000
G4 P0.0 ; distance: 0.26mm, speed: 569.2mm/min
G1 X86.094 Y173.564 F12000
G4 P0.0 ; distance: 0.26mm, speed: 569.2mm/min

G1 X86.253 Y173.705 F12000
G4 P0.0 ; distance: 0.21mm, speed: 464.1mm/min

; ------------------- FOOTER BEGIN -------------------

;TYPE:Custom
; Filament-specific end gcode
G4 ; wait

G28 W ; home all without mesh bed level
M84 ; disable motors
M73 P100 R0
M73 Q100 S0