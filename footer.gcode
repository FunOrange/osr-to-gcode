
; ------------------- FOOTER BEGIN -------------------

;TYPE:Custom
; Filament-specific end gcode
; G4 ; wait

; G28 W ; home all without mesh bed level
G1 X10.0 F4000 ; move aside
M84 ; disable motors
M73 P100 R0
M73 Q100 S0