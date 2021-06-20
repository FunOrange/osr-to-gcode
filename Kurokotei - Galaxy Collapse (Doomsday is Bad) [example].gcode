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
G1 X90.000 Y176.000 F2000 ; move to tablet origin
G1 Z14 ; lower nozzle to tablet
G4 P2000 ; wait
G1 X98.998 Y173.373 F2000 ; move nozzle to first object
G4 P2000 ; wait

; GET READY TO UNPAUSE HERE!!!!
M300 S262 P50
G4 P450
M300 S328 P50
G4 P450
M300 S393 P50
G4 P450
M300 S524 P10
; UNPAUSE!!!

; START MAP

G1 X98.998 Y169.619 F4504.2 ; move to circle
G4 F0.0 ; wait on circle
G1 X96.785 Y172.659 F4513.0 ; move to circle
G4 F0.0 ; wait on circle
G1 X100.368 Y171.496 F4520.8 ; move to circle
G4 F0.0 ; wait on circle
G1 X96.785 Y170.351 F4513.9 ; move to circle
G4 F0.0 ; wait on circle
G1 X96.972 Y174.424 F4892.2 ; move to circle
G4 F0.0 ; wait on circle
G1 X100.781 Y170.614 F6464.1 ; move to circle
G4 F0.0 ; wait on circle
G1 X95.453 Y171.458 F6473.2 ; move to circle
G4 F0.0 ; wait on circle
G1 X100.237 Y173.917 F6454.2 ; move to circle
G4 F0.0 ; wait on circle
G1 X97.798 Y169.112 F6465.6 ; move to circle
G4 F0.0 ; wait on circle
G1 X95.190 Y173.354 F5974.7 ; move to circle
G4 F0.0 ; wait on circle
G1 X100.837 Y172.453 F6861.7 ; move to circle
G4 F0.0 ; wait on circle
G1 X98.304 Y171.271 F3354.0 ; move to slider
G4 F0.0 ; wait on slider
G4 F200.0 ; wait on slider
G4 P2000 ; wait
G1 X98.998 Y173.373 F2000 ; move nozzle to first object
G4 P2000 ; wait

; GET READY TO UNPAUSE HERE!!!!
M300 S262 P50
G4 P450
M300 S328 P50
G4 P450
M300 S393 P50
G4 P450
M300 S524 P10
; UNPAUSE!!!

; START MAP

G1 X98.998 Y169.619 F4504.2 ; move to circle
G4 F0.0 ; wait on circle
G1 X96.785 Y172.659 F4513.0 ; move to circle
G4 F0.0 ; wait on circle
G1 X100.368 Y171.496 F4520.8 ; move to circle
G4 F0.0 ; wait on circle
G1 X96.785 Y170.351 F4513.9 ; move to circle
G4 F0.0 ; wait on circle
G1 X96.972 Y174.424 F4892.2 ; move to circle
G4 F0.0 ; wait on circle
G1 X100.781 Y170.614 F6464.1 ; move to circle
G4 F0.0 ; wait on circle
G1 X95.453 Y171.458 F6473.2 ; move to circle
G4 F0.0 ; wait on circle
G1 X100.237 Y173.917 F6454.2 ; move to circle
G4 F0.0 ; wait on circle
G1 X97.798 Y169.112 F6465.6 ; move to circle
G4 F0.0 ; wait on circle
G1 X95.190 Y173.354 F5974.7 ; move to circle
G4 F0.0 ; wait on circle
G1 X100.837 Y172.453 F6861.7 ; move to circle
G4 F0.0 ; wait on circle
G1 X98.304 Y171.271 F3354.0 ; move to slider
G4 F0.0 ; wait on slider
G4 F200.0 ; wait on slider
G4 P2000 ; wait
G1 X98.998 Y173.373 F2000 ; move nozzle to first object
G4 P2000 ; wait

; GET READY TO UNPAUSE HERE!!!!
M300 S262 P50
G4 P450
M300 S328 P50
G4 P450
M300 S393 P50
G4 P450
M300 S524 P10
; UNPAUSE!!!

; START MAP

G1 X98.998 Y169.619 F4504.2 ; move to circle
G4 F0.0 ; wait on circle
G1 X96.785 Y172.659 F4513.0 ; move to circle
G4 F0.0 ; wait on circle
G1 X100.368 Y171.496 F4520.8 ; move to circle
G4 F0.0 ; wait on circle
G1 X96.785 Y170.351 F4513.9 ; move to circle
G4 F0.0 ; wait on circle
G1 X96.972 Y174.424 F4892.2 ; move to circle
G4 F0.0 ; wait on circle
G1 X100.781 Y170.614 F6464.1 ; move to circle
G4 F0.0 ; wait on circle
G1 X95.453 Y171.458 F6473.2 ; move to circle
G4 F0.0 ; wait on circle
G1 X100.237 Y173.917 F6454.2 ; move to circle
G4 F0.0 ; wait on circle
G1 X97.798 Y169.112 F6465.6 ; move to circle
G4 F0.0 ; wait on circle
G1 X95.190 Y173.354 F5974.7 ; move to circle
G4 F0.0 ; wait on circle
G1 X100.837 Y172.453 F6861.7 ; move to circle
G4 F0.0 ; wait on circle
G1 X98.304 Y171.271 F3354.0 ; move to slider
G4 F0.0 ; wait on slider
G4 F200.0 ; wait on slider
G4 P2000 ; wait
G1 X98.998 Y173.373 F2000 ; move nozzle to first object
G4 P2000 ; wait

; GET READY TO UNPAUSE HERE!!!!
M300 S262 P50
G4 P450
M300 S328 P50
G4 P450
M300 S393 P50
G4 P450
M300 S524 P10
; UNPAUSE!!!

; START MAP

G1 X98.998 Y169.619 F4504.2 ; move to circle
G4 F0.0 ; wait on circle
G1 X96.785 Y172.659 F4513.0 ; move to circle
G4 F0.0 ; wait on circle
G1 X100.368 Y171.496 F4520.8 ; move to circle
G4 F0.0 ; wait on circle
G1 X96.785 Y170.351 F4513.9 ; move to circle
G4 F0.0 ; wait on circle
G1 X96.972 Y174.424 F4892.2 ; move to circle
G4 F0.0 ; wait on circle
G1 X100.781 Y170.614 F6464.1 ; move to circle
G4 F0.0 ; wait on circle
G1 X95.453 Y171.458 F6473.2 ; move to circle
G4 F0.0 ; wait on circle
G1 X100.237 Y173.917 F6454.2 ; move to circle
G4 F0.0 ; wait on circle
G1 X97.798 Y169.112 F6465.6 ; move to circle
G4 F0.0 ; wait on circle
G1 X95.190 Y173.354 F5974.7 ; move to circle
G4 F0.0 ; wait on circle
G1 X100.837 Y172.453 F6861.7 ; move to circle
G4 F0.0 ; wait on circle
G1 X98.304 Y171.271 F3354.0 ; move to slider
G4 F0.0 ; wait on slider
G4 F200.0 ; wait on slider

; ------------------- FOOTER BEGIN -------------------

;TYPE:Custom
; Filament-specific end gcode
G4 ; wait

G28 W ; home all without mesh bed level
M84 ; disable motors
M73 P100 R0
M73 Q100 S0