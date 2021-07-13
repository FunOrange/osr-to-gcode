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
; G28 W ; home all without mesh bed level
; G1 X0 Y0 F1000.0 ; go outside print area

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
G1 X83.786 Y173.502 F2000 ; move to first hit object in the map
G4 P1760 ; wait until first object
; START MAP

G1 X84.631 Y171.216 F16000 ; (2) distance: 2.44mm, speed: 1341.3mm/min
G4 P18.0                   ; (2) LOCK
; pink LOCK
G1 X84.621 Y172.803 F16000 ; (1) distance: 1.59mm, speed: 873.2mm/min
G4 P23.0                   ; (1) LOCK
G1 X82.323 Y172.330 F16000 ; (2) distance: 2.35mm, speed: 1291.5mm/min
G4 P23.0                   ; (2) LOCK
; purple LOCK
G1 X85.100 Y171.926 F16000 ; (1) distance: 2.81mm, speed: 1558.7mm/min
G4 P22.0                   ; (1) LOCK
G1 X83.195 Y172.586 F16000 ; (2) distance: 2.02mm, speed: 1109.3mm/min
G4 P23.0                   ; (2) LOCK
; white LOCK
G1 X83.805 Y171.079 F16000 ; (1) distance: 1.63mm, speed: 895.1mm/min
G4 P23.0                   ; (1) LOCK --- speed up here ---
G1 X84.555 Y173.699 F16000 ; (2) distance: 2.73mm, speed: 1514.5mm/min
G4 P18.0                   ; (2) LOCK
; cyan LOCK
G1 X83.252 Y171.680 F16000 ; (1) distance: 2.40mm, speed: 1323.4mm/min
G4 P19.0                   ; (1) LOCK
G1 X85.118 Y170.960 F16000 ; (2) distance: 2.00mm, speed: 1101.1mm/min
G4 P19.0                   ; (2) LOCK
; green LOCK
G1 X82.548 Y171.157 F16000 ; (1) distance: 2.58mm, speed: 1432.0mm/min
G4 P18.0                   ; (1) LOCK
G1 X84.274 Y172.350 F16000 ; (2) distance: 2.10mm, speed: 1154.7mm/min
G4 P19.0                   ; (2) LOCK
; pink LOCK
G1 X83.149 Y170.714 F16000 ; (1) distance: 1.99mm, speed: 1092.9mm/min
G4 P19.0                   ; (1) LOCK
G1 X82.914 Y172.704 F16000 ; (2) distance: 2.00mm, speed: 1103.1mm/min
G4 P19.0                   ; (2) LOCK

G1 X84.349 Y171.226 F16000 ; (1) distance: 2.06mm, speed: 1144.5mm/min
G4 P18.0                   ; (1) LOCK
G1 X81.985 Y172.005 F16000 ; (2) distance: 2.49mm, speed: 1369.9mm/min
G4 P19.0                   ; (2) LOCK

G1 X83.749 Y173.522 F16000 ; (1) distance: 2.33mm, speed: 1280.6mm/min
G4 P19.0                   ; (1) LOCK
G1 X82.539 Y171.266 F16000 ; (2) distance: 2.56mm, speed: 1422.4mm/min
G4 P18.0                   ; (2) LOCK

G1 X82.623 Y173.896 F16000 ; (1) distance: 2.63mm, speed: 1448.8mm/min
G4 P19.0                   ; (1) LOCK
G1 X84.077 Y172.527 F16000 ; (2) distance: 2.00mm, speed: 1099.5mm/min
G4 P19.0                   ; (2) LOCK

G1 X81.845 Y173.128 F16000 ; (1) distance: 2.31mm, speed: 1284.4mm/min
G4 P18.0                   ; (1) LOCK
G1 X83.664 Y174.291 F16000 ; (2) distance: 2.16mm, speed: 1188.7mm/min
G4 P19.0                   ; (2) LOCK

G1 X83.045 Y171.857 F16000 ; (1) distance: 2.51mm, speed: 1382.3mm/min
G4 P19.0                   ; (1) LOCK
G1 X82.548 Y173.975 F16000 ; (2) distance: 2.18mm, speed: 1208.8mm/min
G4 P18.0                   ; (2) LOCK

G1 X84.978 Y173.493 F16000 ; (1)===D distance: 2.48mm, speed: 1363.4mm/min
G4 P59.0                   ; (1)===D LOCK

G1 X82.511 Y172.685 F16000 ; (1)===D distance: 2.60mm, speed: 714.5mm/min
G4 P128.0                  ; (1)===D LOCK

G1 X85.841 Y172.507 F16000 ; (1)===D distance: 3.33mm, speed: 922.0mm/min
G4 P127.0                  ; (1)===D LOCK

G1 X83.064 Y171.719 F16000 ; (1)===D distance: 2.89mm, speed: 798.0mm/min
G4 P127.0                  ; (1)===D LOCK
; --- slow down here --- LOCK
G1 X82.032 Y172.113 F16000 ; (1) distance: 1.10mm, speed: 304.0mm/min
G4 P92. 0                  ; (1) LOCK
G1 X84.190 Y172.596 F16000 ; (2) distance: 2.21mm, speed: 1228.2mm/min
G4 P21.0                   ; (2) LOCK

G1 X82.717 Y172.734 F16000 ; (1) distance: 1.48mm, speed: 814.2mm/min
G4 P22.0                   ; (1) LOCK
G1 X84.265 Y171.128 F16000 ; (2) distance: 2.23mm, speed: 1227.7mm/min
G4 P22.0                   ; (2) LOCK

G1 X83.439 Y173.433 F16000 ; (1) distance: 2.45mm, speed: 1348.0mm/min
G4 P22.0                   ; (1) LOCK
G1 X82.548 Y171.276 F16000 ; (2) distance: 2.33mm, speed: 1297.0mm/min
G4 P21.0                   ; (2) LOCK

G1 X82.473 Y173.709 F16000 ; (1) distance: 2.43mm, speed: 1340.3mm/min
G4 P22.0                   ; (1) LOCK
G1 X84.058 Y172.478 F16000 ; (2) distance: 2.01mm, speed: 1105.0mm/min
G4 P22.0                   ; (2) LOCK
; green slider LOCK
G1 X84.330 Y174.320 F16000 ; (1)===D distance: 1.86mm, speed: 1034.7mm/min
G4 P98.0                   ; (1)===D LOCK

G1 X82.370 Y172.074 F16000 ; (1) distance: 2.98mm, speed: 820.6mm/min
G4 P68.0                  ; (1) LOCK
G1 X81.657 Y173.828 F16000 ; (2) distance: 1.89mm, speed: 1051.8mm/min
G4 P19.0                   ; (2) LOCK

G1 X83.242 Y171.798 F16000 ; (1) distance: 2.58mm, speed: 1417.6mm/min
G4 P20.0                   ; (1) LOCK
G1 X83.599 Y173.473 F16000 ; (2) distance: 1.71mm, speed: 942.7mm/min
G4 P20.0                   ; (2) LOCK

G1 X82.211 Y171.187 F16000 ; (1) distance: 2.67mm, speed: 1485.8mm/min
G4 P19.0                   ; (1) LOCK
G1 X84.237 Y171.857 F16000 ; (2) distance: 2.13mm, speed: 1174.7mm/min
G4 P20.0                   ; (2) LOCK

G1 X82.651 Y172.832 F16000 ; (1) distance: 1.86mm, speed: 1024.6mm/min
G4 P20.0                   ; (1) LOCK
G1 X83.411 Y170.803 F16000 ; (2) distance: 2.17mm, speed: 1193.0mm/min
G4 P20.0                   ; (2) LOCK

G1 X84.387 Y173.246 F16000 ; (1) distance: 2.63mm, speed: 1461.7mm/min
G4 P19.0                   ; (1) LOCK
G1 X82.267 Y172.024 F16000 ; (2) distance: 2.45mm, speed: 1346.8mm/min
G4 P20.0                   ; (2) LOCK

G1 X85.024 Y172.399 F16000 ; (1) distance: 2.78mm, speed: 1531.9mm/min
G4 P20.0                   ; (1) LOCK
G1 X83.186 Y173.768 F16000 ; (2) distance: 2.29mm, speed: 1273.6mm/min
G4 P19.0                   ; (2) LOCK

G1 X84.237 Y171.739 F16000 ; (1) distance: 2.29mm, speed: 1258.0mm/min
G4 P20.0                   ; (1) LOCK
G1 X84.190 Y174.133 F16000 ; (2) distance: 2.39mm, speed: 1318.2mm/min
G4 P20.0                   ; (2) LOCK
; white slider LOCK
G1 X83.149 Y171.630 F16000 ; (1)===D distance: 2.71mm, speed: 1505.9mm/min
G4 P88.0                   ; (1)===D +70 LOCK 

G1 X83.149 Y173.985 F16000 ; (1) distance: 2.35mm, speed: 648.1mm/min
G4 P73.0                  ; (1) -55 LOCK
G1 X85.615 Y174.025 F16000 ; (2) distance: 2.47mm, speed: 1370.7mm/min
G4 P19.0                   ; (2) LOCK

G1 X84.002 Y172.556 F16000 ; (1) distance: 2.18mm, speed: 1200.7mm/min
G4 P20.0                   ; (1) LOCK
G1 X85.803 Y172.064 F16000 ; (2) distance: 1.87mm, speed: 1027.8mm/min
G4 P20.0                   ; (2) LOCK

G1 X84.115 Y173.621 F16000 ; (1) distance: 2.30mm, speed: 1264.2mm/min
G4 P20.0                   ; (1) LOCK
G1 X84.143 Y171.611 F16000 ; (2) distance: 2.01mm, speed: 1116.8mm/min
G4 P19.0                   ; (2) LOCK
; purple slider LOCK
G1 X86.216 Y173.118 F16000 ; (1)===D distance: 2.56mm, speed: 1410.9mm/min
G4 P89.0                   ; (1)===D +70 LOCK

G1 X84.105 Y172.803 F16000 ; (1) distance: 2.13mm, speed: 590.0mm/min
G4 P72.0                  ; (1) -55 LOCK
G1 X83.599 Y170.921 F16000 ; (2) distance: 1.95mm, speed: 1072.8mm/min
G4 P20.0                   ; (2) LOCK

G1 X84.940 Y172.369 F16000 ; (1) distance: 1.97mm, speed: 1086.6mm/min
G4 P20.0                   ; (1) LOCK
G1 X83.083 Y172.556 F16000 ; (2) distance: 1.87mm, speed: 1037.0mm/min
G4 P19.0                   ; (2) LOCK

G1 X84.612 Y170.773 F16000 ; (1) distance: 2.35mm, speed: 1293.1mm/min
G4 P20.0                   ; (1) LOCK
G1 X83.730 Y173.433 F16000 ; (2) distance: 2.80mm, speed: 1542.7mm/min
G4 P20.0                   ; (2) LOCK
; pink slider LOCK
G1 X82.229 Y171.877 F16000 ; (1)===D distance: 2.16mm, speed: 1190.3mm/min
G4 P89.0                   ; (1)===D +70 LOCK

G1 X82.933 Y173.788 F16000 ; (1) distance: 2.04mm, speed: 563.2mm/min
G4 P72.0                  ; (1) -55 LOCK
G1 X84.077 Y171.896 F16000 ; (2) distance: 2.21mm, speed: 1217.0mm/min
G4 P20.0                   ; (2) LOCK

G1 X84.631 Y173.946 F16000 ; (1) distance: 2.12mm, speed: 1179.3mm/min
G4 P19.0                   ; (1) LOCK
G1 X82.811 Y172.359 F16000 ; (2) distance: 2.41mm, speed: 1328.8mm/min
G4 P20.0                   ; (2) LOCK

G1 X84.978 Y172.054 F16000 ; (1) distance: 2.19mm, speed: 1204.5mm/min
G4 P20.0                   ; (1) LOCK
G1 X84.255 Y170.724 F16000 ; (2) distance: 1.51mm, speed: 840.9mm/min
G4 P19.0                   ; (2) LOCK
; green slider LOCK
G1 X83.674 Y173.364 F16000 ; (1)===D distance: 2.70mm, speed: 1488.4mm/min
G4 P89.0                   ; (1)===D +70 LOCK

G1 X82.867 Y170.921 F16000 ; (1) distance: 2.57mm, speed: 711.5mm/min
G4 P72.0                  ; (1) -55 LOCK
G1 X81.713 Y172.409 F16000 ; (2) distance: 1.88mm, speed: 1036.4mm/min
G4 P20.0                   ; (2) LOCK
; --- need to speed up here --- LOCK
G1 X84.152 Y172.064 F16000 ; (1) distance: 2.46mm, speed: 1355.8mm/min
G4 P15.0                   ; (1)
G1 X82.576 Y173.473 F16000 ; (2) distance: 2.11mm, speed: 1163.6mm/min
G4 P15.0                   ; (2)

G1 X81.704 Y171.128 F16000 ; (1) distance: 2.50mm, speed: 1390.0mm/min
G4 P14.0                   ; (1)
G1 X83.242 Y174.241 F16000 ; (2) distance: 3.47mm, speed: 1911.6mm/min
G4 P15.0                   ; (2)

G1 X83.693 Y171.492 F16000 ; (1) distance: 2.79mm, speed: 1533.3mm/min
G4 P15.0                   ; (1)
G1 X81.704 Y173.286 F16000 ; (2) distance: 2.68mm, speed: 1487.6mm/min
G4 P14.0                   ; (2)

G1 X84.518 Y173.640 F16000 ; (1) distance: 2.84mm, speed: 1561.2mm/min
G4 P15.0                   ; (1)
G1 X82.257 Y172.399 F16000 ; (2) distance: 2.58mm, speed: 1419.6mm/min
G4 P15.0                   ; (2)

G1 X84.612 Y172.143 F16000 ; (1) distance: 2.37mm, speed: 1315.7mm/min
G4 P14.0                   ; (1)
G1 X82.436 Y173.778 F16000 ; (2) distance: 2.72mm, speed: 1498.5mm/min
G4 P15.0                   ; (2)

G1 X82.783 Y171.285 F16000 ; (1) distance: 2.52mm, speed: 1385.4mm/min
G4 P15.0                   ; (1)
G1 X83.336 Y174.084 F16000 ; (2) distance: 2.85mm, speed: 1570.1mm/min
G4 P15.0                   ; (2)

G1 X81.657 Y171.522 F16000 ; (1) distance: 3.06mm, speed: 1701.6mm/min
G4 P14.0                   ; (1)
G1 X84.208 Y171.216 F16000 ; (2) distance: 2.57mm, speed: 1414.4mm/min
G4 P15.0                   ; (2)

G1 X81.845 Y173.187 F16000 ; (1) distance: 3.08mm, speed: 1694.0mm/min
G4 P15.0                   ; (1)
G1 X84.321 Y173.532 F16000 ; (2) distance: 2.50mm, speed: 1389.0mm/min
G4 P14.0                   ; (2)

G1 X82.698 Y171.345 F16000 ; (1) distance: 2.72mm, speed: 1499.2mm/min
G4 P15.0                   ; (1)
G1 X82.501 Y173.975 F16000 ; (2) distance: 2.64mm, speed: 1452.2mm/min
G4 P15.0                   ; (2)

G1 X84.312 Y172.310 F16000 ; (1) distance: 2.46mm, speed: 1366.5mm/min
G4 P14.0                   ; (1)
G1 X81.751 Y172.251 F16000 ; (2) distance: 2.56mm, speed: 1409.9mm/min
G4 P15.0                   ; (2)

G1 X83.768 Y174.153 F16000 ; (1) distance: 2.77mm, speed: 1525.8mm/min
G4 P15.0                   ; (1)
G1 X84.387 Y171.512 F16000 ; (2) distance: 2.71mm, speed: 1506.8mm/min
G4 P14.0                   ; (2)

G1 X85.475 Y173.374 F16000 ; (1) distance: 2.16mm, speed: 1187.2mm/min
G4 P15.0                   ; (1)
G1 X84.846 Y170.803 F16000 ; (2) distance: 2.65mm, speed: 1457.2mm/min
G4 P15.0                   ; (2)

G1 X83.674 Y173.000 F16000 ; (1) distance: 2.49mm, speed: 1370.9mm/min
G4 P15.0                   ; (1)
G1 X86.122 Y172.704 F16000 ; (2) distance: 2.47mm, speed: 1370.0mm/min
G4 P14.0                   ; (2)

G1 X83.027 Y172.162 F16000 ; (1) distance: 3.14mm, speed: 1729.8mm/min
G4 P15.0                   ; (1)
G1 X84.818 Y173.808 F16000 ; (2) distance: 2.43mm, speed: 1339.0mm/min
G4 P15.0                   ; (2)

G1 X85.362 Y172.241 F16000 ; (1)===D distance: 1.66mm, speed: 921.3mm/min
G4 P88.0                   ; (1)===D +70 LOCK

G1 X82.858 Y173.079 F16000 ; (1)===D distance: 2.64mm, speed: 726.8mm/min
G4 P124.0                  ; (1)===D

G1 X83.946 Y171.010 F16000 ; (1)===D distance: 2.34mm, speed: 646.4mm/min
G4 P123.0                  ; (1)===D

G1 X84.715 Y173.916 F16000 ; (1)===D distance: 3.01mm, speed: 827.5mm/min
G4 P124.0                  ; (1)===D

G1 X82.764 Y173.926 F16000 ; (1) distance: 1.95mm, speed: 539.5mm/min
G4 P56.0                  ; (1) -55 -16 LOCK
G1 X81.620 Y171.394 F16000 ; (2) distance: 2.78mm, speed: 1529.6mm/min
G4 P15.0                   ; (2)

G1 X83.927 Y173.128 F16000 ; (1) distance: 2.89mm, speed: 1603.6mm/min
G4 P14.0                   ; (1)
G1 X81.620 Y174.064 F16000 ; (2) distance: 2.49mm, speed: 1370.7mm/min
G4 P15.0                   ; (2)

G1 X84.659 Y173.699 F16000 ; (1) distance: 3.06mm, speed: 1684.9mm/min
G4 P15.0                   ; (1)
G1 X82.417 Y172.458 F16000 ; (2) distance: 2.56mm, speed: 1423.7mm/min
G4 P14.0                   ; (2)

G1 X85.522 Y172.990 F16000 ; (1) distance: 3.15mm, speed: 1733.9mm/min
G4 P15.0                   ; (1)
G1 X83.252 Y173.542 F16000 ; (2) distance: 2.34mm, speed: 1285.9mm/min
G4 P15.0                   ; (2)

G1 X86.338 Y173.936 F16000 ; (1) distance: 3.11mm, speed: 1728.4mm/min
G4 P14.0                   ; (1)
G1 X84.912 Y172.143 F16000 ; (2) distance: 2.29mm, speed: 1261.1mm/min
G4 P15.0                   ; (2)

G1 X85.569 Y174.330 F16000 ; (1) distance: 2.28mm, speed: 1257.1mm/min
G4 P15.0                   ; (1)
G1 X86.038 Y171.611 F16000 ; (2) distance: 2.76mm, speed: 1519.0mm/min
G4 P15.0                   ; (2)

G1 X84.677 Y173.936 F16000 ; (1) distance: 2.69mm, speed: 1496.6mm/min
G4 P14.0                   ; (1)
G1 X84.208 Y171.364 F16000 ; (2) distance: 2.61mm, speed: 1438.9mm/min
G4 P15.0                   ; (2)

G1 X83.683 Y173.650 F16000 ; (1) distance: 2.35mm, speed: 1291.1mm/min
G4 P15.0                   ; (1)
G1 X84.978 Y171.049 F16000 ; (2) distance: 2.91mm, speed: 1614.1mm/min
G4 P14.0                   ; (2)

G1 X83.167 Y172.941 F16000 ; (1) distance: 2.62mm, speed: 1441.3mm/min
G4 P15.0                   ; (1)
G1 X82.689 Y171.128 F16000 ; (2) distance: 1.87mm, speed: 1032.1mm/min
G4 P15.0                   ; (2)

G1 X82.726 Y173.788 F16000 ; (1) distance: 2.66mm, speed: 1478.1mm/min
G4 P14.0                   ; (1)
G1 X83.936 Y172.024 F16000 ; (2) distance: 2.14mm, speed: 1177.3mm/min
G4 P15.0                   ; (2)

G1 X81.751 Y172.665 F16000 ; (1) distance: 2.28mm, speed: 1253.6mm/min
G4 P15.0                   ; (1)
G1 X84.255 Y173.414 F16000 ; (2) distance: 2.61mm, speed: 1438.9mm/min
G4 P15.0                   ; (2)

G1 X82.295 Y171.827 F16000 ; (1) distance: 2.52mm, speed: 1401.0mm/min
G4 P14.0                   ; (1)
G1 X83.496 Y174.064 F16000 ; (2) distance: 2.54mm, speed: 1397.3mm/min
G4 P15.0                   ; (2)

G1 X84.677 Y171.798 F16000 ; (1) distance: 2.56mm, speed: 1406.9mm/min
G4 P15.0                   ; (1)
G1 X85.109 Y174.133 F16000 ; (2) distance: 2.37mm, speed: 1319.3mm/min
G4 P14.0                   ; (2)

G1 X83.242 Y172.458 F16000 ; (1) distance: 2.51mm, speed: 1380.5mm/min
G4 P15.0                   ; (1)
G1 X85.737 Y173.305 F16000 ; (2) distance: 2.64mm, speed: 1450.5mm/min
G4 P15.0                   ; (2)

G1 X84.246 Y174.369 F16000 ; (1) distance: 1.83mm, speed: 1017.8mm/min
G4 P14.0                   ; (1)
G1 X83.861 Y171.729 F16000 ; (2) distance: 2.67mm, speed: 1468.9mm/min
G4 P15.0                   ; (2)

G1 X84.856 Y173.246 F16000 ; (1)===D distance: 1.81mm, speed: 998.6mm/min
G4 P1000.0                   ; (1)===D LOCK

; ------------------- FOOTER BEGIN -------------------

;TYPE:Custom
; Filament-specific end gcode
; G4 ; wait

; G28 W ; home all without mesh bed level
G1 X10.0 ; move aside
M84 ; disable motors
M73 P100 R0
M73 Q100 S0