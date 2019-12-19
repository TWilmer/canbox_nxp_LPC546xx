EESchema Schematic File Version 5
LIBS:canbox-cache
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 6
Title "CANBOX LPC546xx"
Date "2019-06-02"
Rev "1"
Comp "Thorsten Wilmer"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
Comment5 ""
Comment6 ""
Comment7 ""
Comment8 ""
Comment9 ""
$EndDescr
$Sheet
S 2500 2150 2050 1000
U 5BD9E863
F0 "MCU" 50
F1 "MCU.sch" 50
F2 "3V3" I R 4550 2500 50 
F3 "3V3_LC" I R 4550 2300 50 
$EndSheet
$Sheet
S 6700 2250 2450 1000
U 5BDA0002
F0 "Ethernet" 50
F1 "Ethernet.sch" 50
F2 "3V3" I L 6700 2650 50 
F3 "5V" I L 6700 2850 50 
$EndSheet
$Sheet
S 6650 4150 2550 1150
U 5BDA19BB
F0 "CAN" 50
F1 "CAN.sch" 50
F2 "5V" I L 6650 4350 50 
$EndSheet
$Sheet
S 2750 4250 2450 1050
U 5BDA6772
F0 "PowerSupply" 50
F1 "PowerSupply.sch" 50
F2 "3V3" O R 5200 4500 50 
F3 "5V" O R 5200 4750 50 
F4 "3V3_LC" O R 5200 5100 50 
$EndSheet
Wire Wire Line
	5200 4500 5650 4500
Wire Wire Line
	5650 4500 5650 2650
Wire Wire Line
	4550 2500 5650 2500
Wire Wire Line
	6700 2650 5650 2650
Connection ~ 5650 2650
Wire Wire Line
	5650 2650 5650 2500
Wire Wire Line
	5200 4750 6150 4750
Wire Wire Line
	6150 4750 6150 4350
Wire Wire Line
	6150 4350 6650 4350
$Sheet
S 2550 950  1850 800 
U 5CA6EA6B
F0 "RelayButtons" 50
F1 "RelayButtons.sch" 50
F2 "5V" I R 4400 1350 50 
F3 "3V3" I R 4400 1550 50 
$EndSheet
Wire Wire Line
	6150 4350 6150 2850
Wire Wire Line
	6150 1350 4400 1350
Connection ~ 6150 4350
Wire Wire Line
	5200 5100 5950 5100
Wire Wire Line
	5950 2300 4550 2300
$Comp
L canbox-rescue:MountingHole-Mechanical H1
U 1 1 5E0AFF15
P 1200 3300
F 0 "H1" H 1300 3346 50  0000 L CNN
F 1 "MountingHole-Mechanical" H 1300 3255 50  0000 L CNN
F 2 "MountingHole:MountingHole_2.2mm_M2_DIN965" H 1200 3300 50  0001 C CNN
F 3 "" H 1200 3300 50  0001 C CNN
	1    1200 3300
	1    0    0    -1  
$EndComp
$Comp
L canbox-rescue:MountingHole-Mechanical H2
U 1 1 5E0B01F5
P 1200 3700
F 0 "H2" H 1300 3746 50  0000 L CNN
F 1 "MountingHole-Mechanical" H 1300 3655 50  0000 L CNN
F 2 "MountingHole:MountingHole_2.2mm_M2_DIN965" H 1200 3700 50  0001 C CNN
F 3 "" H 1200 3700 50  0001 C CNN
	1    1200 3700
	1    0    0    -1  
$EndComp
$Comp
L canbox-rescue:MountingHole-Mechanical H4
U 1 1 5E0B05BD
P 1200 4350
F 0 "H4" H 1300 4396 50  0000 L CNN
F 1 "MountingHole-Mechanical" H 1300 4305 50  0000 L CNN
F 2 "MountingHole:MountingHole_2.2mm_M2_DIN965" H 1200 4350 50  0001 C CNN
F 3 "" H 1200 4350 50  0001 C CNN
	1    1200 4350
	1    0    0    -1  
$EndComp
Wire Wire Line
	4400 1550 5650 1550
Wire Wire Line
	5650 1550 5650 2500
Connection ~ 5650 2500
Wire Wire Line
	5950 2300 5950 5100
Wire Wire Line
	6700 2850 6150 2850
Connection ~ 6150 2850
Wire Wire Line
	6150 2850 6150 1350
$EndSCHEMATC
