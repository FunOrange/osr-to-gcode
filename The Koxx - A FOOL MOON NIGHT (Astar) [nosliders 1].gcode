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
G1 X88.000 Y172.637 F12000 ; move nozzle on top of start song button
G1 Z14.5 ; lower nozzle to tablet
G1 Z14.00 F9000 ; tap press
G1 Z14.50 F9000 ; tap release
G4 P500 ; wait
G1 X87.600 Y170.511 F2000 ; move nozzle to skip button 
G1 Z14.00 F9000 ; tap press
G1 Z14.50 F9000 ; tap release
G4 P500 ; wait
G1 X82.633 Y174.172 F2000 ; move to first hit object in the map
G4 P1700.0 ; wait until first object
; START MAP


G1 X82.070 Y174.015 F12000
G4 P370.0 ; (1) distance: 0.58mm, speed: 161.6mm/min
G1 X85.597 Y171.808 F12000
G4 P371.0 ; (2) distance: 4.16mm, speed: 1147.7mm/min
G1 X84.368 Y171.798 F12000
G4 P153.0 ; (3) distance: 1.23mm, speed: 679.5mm/min
G1 X83.814 Y171.325 F12000
G4 P0.0 ; LOCK (4) distance: 0.71mm, speed: 785.6mm/min
G1 X84.237 Y171.088 F12000
G4 P45.0 ; (5) distance: 0.48mm, speed: 532.6mm/min
G1 X84.480 Y173.000 F12000
G4 P153.0 ; (6) distance: 1.93mm, speed: 1065.6mm/min

G1 X82.445 Y171.207 F12000
G4 P154.0 ; (1) distance: 2.71mm, speed: 1493.2mm/min
G1 X82.567 Y171.039 F12000
G4 P44.0 ; (2) distance: 0.21mm, speed: 230.2mm/min

G1 X82.398 Y172.024 F12000
G4 P154.0 ; (1) distance: 1.00mm, speed: 550.3mm/min
G1 X81.957 Y172.616 F12000
G4 P44.0 ; (2) distance: 0.74mm, speed: 819.4mm/min

G1 X82.783 Y172.951 F12000
G4 P154.0 ; (1) distance: 0.89mm, speed: 490.4mm/min
G1 X83.364 Y172.734 F12000
G4 P45.0 ; (2) distance: 0.62mm, speed: 683.3mm/min

G1 X83.702 Y173.699 F12000
G4 P153.0 ; (1) distance: 1.02mm, speed: 565.7mm/min
G1 X84.330 Y173.985 F12000
G4 P45.0 ; (2) distance: 0.69mm, speed: 760.0mm/min

G1 X83.270 Y173.926 F12000
G4 P153.0 ; (1) distance: 1.06mm, speed: 587.0mm/min
G1 X82.576 Y174.074 F12000
G4 P45.0 ; (2) distance: 0.71mm, speed: 781.3mm/min

G1 X82.529 Y173.177 F12000
G4 P153.0 ; (1) distance: 0.90mm, speed: 496.5mm/min
G1 X83.214 Y171.778 F12000
G4 P45.0 ; (2) distance: 1.56mm, speed: 1714.9mm/min

G1 X83.139 Y172.773 F12000
G4 P153.0 ; (1) distance: 1.00mm, speed: 551.9mm/min
G1 X82.614 Y171.433 F12000
G4 P45.0 ; (2) distance: 1.44mm, speed: 1584.5mm/min

G1 X83.664 Y171.354 F12000
G4 P153.0 ; (1) distance: 1.05mm, speed: 582.6mm/min
G1 X84.227 Y170.950 F12000
G4 P45.0 ; (2) distance: 0.69mm, speed: 762.7mm/min

G1 X84.133 Y172.054 F12000
G4 P153.0 ; (1) distance: 1.11mm, speed: 612.4mm/min
G1 X84.499 Y172.665 F12000
G4 P45.0 ; (2) distance: 0.71mm, speed: 783.9mm/min

G1 X83.749 Y172.675 F12000
G4 P200.0 ; LOCK (1) distance: 0.75mm, speed: 415.0mm/min
G1 X83.045 Y172.330 F12000
G4 P45.0 ; (2) distance: 0.78mm, speed: 862.5mm/min

G1 X82.248 Y172.330 F12000
G4 P154.0 ; (1) distance: 0.80mm, speed: 438.9mm/min
G1 X82.801 Y173.177 F12000
G4 P44.0 ; (2) distance: 1.01mm, speed: 1124.5mm/min

G1 X82.492 Y172.951 F12000
G4 P154.0 ; (1) distance: 0.38mm, speed: 211.2mm/min
G1 X83.486 Y173.059 F12000
G4 P44.0 ; (2) distance: 1.00mm, speed: 1111.3mm/min

G1 X83.083 Y174.015 F12000
G4 P114.0 ; LOCK (1) distance: 1.04mm, speed: 571.0mm/min
G1 X82.436 Y174.212 F12000
G4 P64.0 ; LOCK (was too fast) (2) distance: 0.68mm, speed: 751.7mm/min

G1 X83.486 Y174.310 F12000
G4 P154.0 ; (1) distance: 1.06mm, speed: 580.8mm/min
G1 X84.105 Y173.965 F12000
G4 P44.0 ; (2) distance: 0.71mm, speed: 787.4mm/min

G1 X85.024 Y173.759 F12000
G4 P154.0 ; (1) distance: 0.94mm, speed: 518.7mm/min
G1 X84.659 Y174.350 F12000
G4 P65.0 ; LOCK (was too fast) (2) distance: 0.70mm, speed: 765.4mm/min

G1 X84.856 Y173.276 F12000
G4 P153.0 ; (1) distance: 1.09mm, speed: 603.8mm/min
G1 X85.372 Y172.773 F12000
G4 P45.0 ; (2) distance: 0.72mm, speed: 792.9mm/min

G1 X85.165 Y171.808 F12000
G4 P153.0 ; (1) distance: 0.99mm, speed: 546.0mm/min
G1 X85.756 Y171.453 F12000
G4 P45.0 ; (2) distance: 0.69mm, speed: 758.8mm/min

G1 X84.696 Y171.512 F12000
G4 P153.0 ; (1) distance: 1.06mm, speed: 587.0mm/min
G1 X84.302 Y170.931 F12000
G4 P45.0 ; (2) distance: 0.70mm, speed: 773.1mm/min

G1 X83.242 Y170.881 F12000
G4 P153.0 ; (1) distance: 1.06mm, speed: 586.8mm/min
G1 X82.558 Y170.724 F12000
G4 P45.0 ; (2) distance: 0.70mm, speed: 773.6mm/min

G1 X82.529 Y171.709 F12000
G4 P153.0 ; (1) distance: 0.99mm, speed: 545.1mm/min
G1 X83.083 Y172.162 F12000
G4 P45.0 ; (2) distance: 0.72mm, speed: 787.5mm/min

G1 X82.032 Y172.054 F12000
G4 P153.0 ; (1) distance: 1.06mm, speed: 584.0mm/min
G1 X81.610 Y172.635 F12000
G4 P45.0 ; (2) distance: 0.72mm, speed: 790.9mm/min
G4 P109.0 ; (3) stationary
G1 X81.713 Y173.315 F12000
G4 P44.0 ; (4) distance: 0.69mm, speed: 764.0mm/min

G1 X82.689 Y174.034 F12000
G4 P45.0 ; (1) distance: 1.21mm, speed: 1334.3mm/min
G4 P109.0 ; (2) stationary
G1 X83.580 Y174.005 F12000
G4 P103.0 ; LOCK (3) distance: 0.89mm, speed: 493.0mm/min
G1 X84.330 Y174.251 F12000
G4 P45.0 ; (4) distance: 0.79mm, speed: 869.5mm/min
G1 X84.462 Y173.729 F12000
G4 P45.0 ; (5) distance: 0.54mm, speed: 592.8mm/min
G1 X84.011 Y172.655 F12000
G4 P44.0 ; (6) distance: 1.16mm, speed: 1293.9mm/min

G1 X83.918 Y171.709 F12000
G4 P154.0 ; (1) distance: 0.95mm, speed: 523.2mm/min
G1 X84.537 Y171.335 F12000
G4 P44.0 ; (2) distance: 0.72mm, speed: 803.9mm/min

G1 X83.430 Y171.404 F12000
G4 P154.0 ; (1) distance: 1.11mm, speed: 610.4mm/min
G1 X82.755 Y171.157 F12000
G4 P45.0 ; (2) distance: 0.72mm, speed: 791.4mm/min

G1 X81.835 Y170.813 F12000
G4 P153.0 ; (1) distance: 0.98mm, speed: 542.9mm/min
G1 X81.713 Y171.542 F12000
G4 P45.0 ; (2) distance: 0.74mm, speed: 813.8mm/min

G1 X81.723 Y172.655 F12000
G4 P153.0 ; (1) distance: 1.11mm, speed: 615.7mm/min
G1 X82.332 Y174.054 F12000
G4 P45.0 ; (2) distance: 1.53mm, speed: 1680.2mm/min

G1 X82.379 Y172.951 F12000
G4 P153.0 ; (1) distance: 1.10mm, speed: 610.8mm/min
G1 X81.854 Y173.414 F12000
G4 P45.0 ; (2) distance: 0.70mm, speed: 770.9mm/min

G1 X82.764 Y173.522 F12000
G4 P153.0 ; (1) distance: 0.92mm, speed: 506.7mm/min
G1 X84.030 Y172.675 F12000
G4 P45.0 ; (2) distance: 1.52mm, speed: 1677.4mm/min

G1 X83.111 Y172.793 F12000
G4 P153.0 ; (1) distance: 0.93mm, speed: 512.5mm/min
G1 X84.424 Y173.295 F12000
G4 P45.0 ; (2) distance: 1.41mm, speed: 1547.9mm/min

G1 X84.152 Y172.231 F12000
G4 P153.0 ; (1) distance: 1.10mm, speed: 607.4mm/min
G1 X84.696 Y170.980 F12000
G4 P45.0 ; (2) distance: 1.36mm, speed: 1502.2mm/min

G1 X84.706 Y171.749 F12000
G4 P153.0 ; (1) distance: 0.77mm, speed: 425.0mm/min
G1 X83.421 Y171.946 F12000
G4 P45.0 ; (2) distance: 1.30mm, speed: 1431.3mm/min

G1 X84.471 Y171.886 F12000
G4 P154.0 ; (1) distance: 1.05mm, speed: 579.2mm/min
G1 X85.175 Y172.300 F12000
G4 P44.0 ; (2) distance: 0.82mm, speed: 906.9mm/min

G1 X85.437 Y171.749 F12000
G4 P154.0 ; (1) distance: 0.61mm, speed: 336.4mm/min
G1 X86.159 Y171.768 F12000
G4 P44.0 ; (2) distance: 0.72mm, speed: 802.8mm/min

G1 X86.150 Y172.783 F12000
G4 P154.0 ; (1) distance: 1.01mm, speed: 558.7mm/min
G1 X85.409 Y173.108 F12000
G4 P44.0 ; (2) distance: 0.81mm, speed: 899.1mm/min

G1 X85.409 Y174.123 F12000
G4 P154.0 ; (1) distance: 1.01mm, speed: 558.6mm/min
G1 X85.925 Y173.621 F12000
G4 P44.0 ; (2) distance: 0.72mm, speed: 800.2mm/min
G1 X86.056 Y173.759 F12000
G4 P46.0 ; (3) distance: 0.19mm, speed: 207.8mm/min
G1 X86.094 Y173.493 F12000
G4 P0.0 ; (4) distance: 0.27mm, speed: 597.0mm/min
G1 X86.056 Y173.759 F12000
G4 P0.0 ; (5) distance: 0.27mm, speed: 597.0mm/min
G1 X86.094 Y173.493 F12000
G4 P0.0 ; (6) distance: 0.27mm, speed: 597.0mm/min

G1 X86.253 Y173.640 F12000
G4 P300.0 ; LOCK (1) distance: 0.22mm, speed: 474.4mm/min

; ------------------- FOOTER BEGIN -------------------

;TYPE:Custom
; Filament-specific end gcode
G4 ; wait

G28 W ; home all without mesh bed level
M84 ; disable motors
M73 P100 R0
M73 Q100 S0