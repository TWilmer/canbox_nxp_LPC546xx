EESchema Schematic File Version 4
LIBS:canbox-cache
EELAYER 29 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 6 6
Title "CANBOX LPC546xx - GPIO Relay"
Date "2019-06-02"
Rev "1"
Comp "Thorsten Wilmer"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L canbox-rescue:Fujitsu_FTR-K3A-Relay K2
U 1 1 5CA79041
P 5900 1450
F 0 "K2" V 5946 1072 50  0000 R CNN
F 1 "FTR-K3AB005W" V 5855 1072 50  0000 R CNN
F 2 "cypress:ALF1T05" H 5900 1050 50  0001 C CNN
F 3 "file:///home/thorsten/Downloads/mech_eng_lf.pdf" H 5950 2000 50  0001 C CNN
F 4 "ALF1T05" H 700 -1600 50  0001 C CNN "OP"
F 5 "ALF1T05" H 0   0   50  0001 C CNN "Arrow"
F 6 "ALF1T05" H 0   0   50  0001 C CNN "DigiKez"
	1    5900 1450
	0    -1   -1   0   
$EndComp
$Comp
L canbox-rescue:ULN2003A-Transistor_Array U8
U 1 1 5CA79D75
P 4200 2200
AR Path="/5CA79D75" Ref="U8"  Part="1" 
AR Path="/5CA6EA6B/5CA79D75" Ref="U8"  Part="1" 
F 0 "U8" H 4200 2867 50  0000 C CNN
F 1 "ULN2003ADRG3" H 4200 2776 50  0000 C CNN
F 2 "Package_SO:SOIC-16_3.9x9.9mm_P1.27mm" H 4250 1650 50  0001 L CNN
F 3 "http://www.ti.com/lit/ds/symlink/uln2003a.pdf" H 4300 2000 50  0001 C CNN
F 4 "595-ULN2003ADR" H 4200 2200 50  0001 C CNN "Mouser"
F 5 "296-27596-1-ND" H 700 -1600 50  0001 C CNN "OP"
F 6 "ULN2003ADRG3" H 0   0   50  0001 C CNN "Arrow"
F 7 "296-27596-1-ND" H 0   0   50  0001 C CNN "DigiKez"
	1    4200 2200
	1    0    0    -1  
$EndComp
$Comp
L canbox-rescue:GND-power #PWR053
U 1 1 5CA7BDDA
P 4200 2950
F 0 "#PWR053" H 4200 2700 50  0001 C CNN
F 1 "GND" H 4205 2777 50  0000 C CNN
F 2 "" H 4200 2950 50  0001 C CNN
F 3 "" H 4200 2950 50  0001 C CNN
	1    4200 2950
	1    0    0    -1  
$EndComp
Text HLabel 3250 800  0    50   Input ~ 0
5V
Wire Wire Line
	5350 2800 4200 2800
Connection ~ 4200 2800
Wire Wire Line
	4200 2800 4200 2950
Wire Wire Line
	5700 1750 5350 1750
Wire Wire Line
	5700 1150 4950 1150
Wire Wire Line
	4950 1150 4950 2100
Wire Wire Line
	4950 2100 4600 2100
$Comp
L lpc_LPC54616J512:LPC54616J512 U1
U 6 1 5BF5C6AF
P 1300 1700
F 0 "U1" H 2208 1865 50  0000 C CNN
F 1 "LPC54616J512" H 2208 1774 50  0000 C CNN
F 2 "Package_QFP:LQFP-100_14x14mm_P0.5mm" H 1350 1550 50  0001 C CNN
F 3 "" H 1350 1550 50  0001 C CNN
F 4 "LPC54616J512BD100E" H 700 -1600 50  0001 C CNN "OP"
F 5 "nm" H 0   0   50  0001 C CNN "Arrow"
	6    1300 1700
	1    0    0    -1  
$EndComp
Wire Wire Line
	3100 2300 3150 2300
Wire Wire Line
	3150 2300 3150 2200
Wire Wire Line
	3150 2200 3800 2200
Wire Wire Line
	3100 2100 3800 2100
Wire Wire Line
	3100 2000 3800 2000
NoConn ~ 3100 2200
NoConn ~ 3100 2400
Wire Wire Line
	3250 800  3650 800 
Wire Wire Line
	4600 800  4600 1800
Wire Wire Line
	3650 900  3650 800 
Connection ~ 3650 800 
Wire Wire Line
	3650 800  4100 800 
$Comp
L canbox-rescue:GND-power #PWR0101
U 1 1 5BF7425E
P 3650 1300
F 0 "#PWR0101" H 3650 1050 50  0001 C CNN
F 1 "GND" H 3655 1127 50  0000 C CNN
F 2 "" H 3650 1300 50  0001 C CNN
F 3 "" H 3650 1300 50  0001 C CNN
	1    3650 1300
	1    0    0    -1  
$EndComp
Wire Wire Line
	3650 1300 3650 1200
$Comp
L canbox-rescue:C-Device C52
U 1 1 5BF75A8E
P 3650 1050
F 0 "C52" H 3765 1096 50  0000 L CNN
F 1 "22u" H 3765 1005 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3688 900 50  0001 C CNN
F 3 "~" H 3650 1050 50  0001 C CNN
F 4 "C0805C224Z3VACTU" H 3650 1050 50  0001 C CNN "OP"
F 5 "ali" H 0   0   50  0001 C CNN "notes"
	1    3650 1050
	1    0    0    -1  
$EndComp
$Comp
L lpc_LPC54616J512:LPC54616J512 U1
U 2 1 5BF5E3C7
P 5450 3650
F 0 "U1" H 6300 3815 50  0000 C CNN
F 1 "LPC54616J512" H 6300 3724 50  0000 C CNN
F 2 "" H 5500 3500 50  0001 C CNN
F 3 "" H 5500 3500 50  0001 C CNN
F 4 "nm" H 0   0   50  0001 C CNN "Arrow"
	2    5450 3650
	-1   0    0    -1  
$EndComp
Wire Wire Line
	3650 4350 3200 4350
Wire Wire Line
	3650 4250 3300 4250
Wire Wire Line
	3400 4150 3650 4150
Wire Wire Line
	3650 4050 3500 4050
Text HLabel 6950 2900 2    50   Input ~ 0
5V
$Comp
L canbox-rescue:LED-Device D6
U 1 1 5BF6EBEC
P 6650 2900
F 0 "D6" H 6643 3116 50  0000 C CNN
F 1 "LED" H 6643 3025 50  0000 C CNN
F 2 "LED_THT:LED_D3.0mm" H 6650 2900 50  0001 C CNN
F 3 "~" H 6650 2900 50  0001 C CNN
F 4 "151033RS03000" H 0   0   50  0001 C CNN "OP"
	1    6650 2900
	1    0    0    -1  
$EndComp
$Comp
L canbox-rescue:LED-Device D7
U 1 1 5BF6FB4D
P 6650 3250
F 0 "D7" H 6643 3466 50  0000 C CNN
F 1 "LED" H 6643 3375 50  0000 C CNN
F 2 "LED_THT:LED_D3.0mm" H 6650 3250 50  0001 C CNN
F 3 "~" H 6650 3250 50  0001 C CNN
F 4 "151033RS03000" H 0   0   50  0001 C CNN "OP"
	1    6650 3250
	1    0    0    -1  
$EndComp
$Comp
L canbox-rescue:LED-Device D8
U 1 1 5BF702EE
P 6650 3600
F 0 "D8" H 6643 3816 50  0000 C CNN
F 1 "LED" H 6643 3725 50  0000 C CNN
F 2 "LED_THT:LED_D3.0mm" H 6650 3600 50  0001 C CNN
F 3 "~" H 6650 3600 50  0001 C CNN
F 4 "151033RS03000" H 0   0   50  0001 C CNN "OP"
	1    6650 3600
	1    0    0    -1  
$EndComp
$Comp
L canbox-rescue:LED-Device D9
U 1 1 5BF70923
P 6650 3950
F 0 "D9" H 6643 4166 50  0000 C CNN
F 1 "LED" H 6643 4075 50  0000 C CNN
F 2 "LED_THT:LED_D3.0mm" H 6650 3950 50  0001 C CNN
F 3 "~" H 6650 3950 50  0001 C CNN
F 4 "151033RS03000" H 0   0   50  0001 C CNN "OP"
	1    6650 3950
	1    0    0    -1  
$EndComp
Wire Wire Line
	6800 3950 6800 3600
Wire Wire Line
	6800 2900 6950 2900
Connection ~ 6800 2900
Connection ~ 6800 3250
Wire Wire Line
	6800 3250 6800 2900
Connection ~ 6800 3600
Wire Wire Line
	6800 3600 6800 3250
$Comp
L canbox-rescue:R-Device R28
U 1 1 5BF78709
P 6250 2900
F 0 "R28" V 6457 2900 50  0000 C CNN
F 1 "300" V 6366 2900 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 6180 2900 50  0001 C CNN
F 3 "~" H 6250 2900 50  0001 C CNN
F 4 "ok" H 0   0   50  0001 C CNN "Mouser"
F 5 "ok" H 0   0   50  0001 C CNN "notes"
	1    6250 2900
	0    -1   -1   0   
$EndComp
$Comp
L canbox-rescue:R-Device R29
U 1 1 5BF797AF
P 6250 3250
F 0 "R29" V 6457 3250 50  0000 C CNN
F 1 "300" V 6366 3250 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 6180 3250 50  0001 C CNN
F 3 "~" H 6250 3250 50  0001 C CNN
F 4 "ok" H 0   0   50  0001 C CNN "Mouser"
F 5 "ok" H 0   0   50  0001 C CNN "notes"
	1    6250 3250
	0    -1   -1   0   
$EndComp
$Comp
L canbox-rescue:R-Device R32
U 1 1 5BF79D84
P 6250 3600
F 0 "R32" V 6457 3600 50  0000 C CNN
F 1 "300" V 6366 3600 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 6180 3600 50  0001 C CNN
F 3 "~" H 6250 3600 50  0001 C CNN
F 4 "ok" H 0   0   50  0001 C CNN "Mouser"
F 5 "ok" H 0   0   50  0001 C CNN "notes"
	1    6250 3600
	0    -1   -1   0   
$EndComp
$Comp
L canbox-rescue:R-Device R33
U 1 1 5BF7A3CB
P 6250 3950
F 0 "R33" V 6457 3950 50  0000 C CNN
F 1 "300" V 6366 3950 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 6180 3950 50  0001 C CNN
F 3 "~" H 6250 3950 50  0001 C CNN
F 4 "ok" H 0   0   50  0001 C CNN "Mouser"
F 5 "ok" H 0   0   50  0001 C CNN "notes"
	1    6250 3950
	0    -1   -1   0   
$EndComp
Wire Wire Line
	6100 2900 5150 2900
Wire Wire Line
	5150 2900 5150 2300
Wire Wire Line
	5150 2300 4600 2300
Wire Wire Line
	6100 3250 5050 3250
Wire Wire Line
	5050 3250 5050 2400
Wire Wire Line
	5050 2400 4600 2400
Wire Wire Line
	6100 3600 5950 3600
Wire Wire Line
	5950 3600 5950 3350
Wire Wire Line
	5950 3350 4950 3350
Wire Wire Line
	4950 3350 4950 2500
Wire Wire Line
	4950 2500 4600 2500
Wire Wire Line
	6100 3950 5850 3950
Wire Wire Line
	5850 3950 5850 3450
Wire Wire Line
	5850 3450 4850 3450
Wire Wire Line
	4850 3450 4850 2600
Wire Wire Line
	4850 2600 4600 2600
Wire Wire Line
	3500 2600 3500 4050
Wire Wire Line
	3500 2600 3800 2600
Wire Wire Line
	3400 2500 3800 2500
Wire Wire Line
	3400 2500 3400 4150
Wire Wire Line
	3300 2400 3300 4250
Wire Wire Line
	3300 2400 3800 2400
Wire Wire Line
	3200 2300 3200 4350
Wire Wire Line
	3200 2300 3800 2300
Wire Wire Line
	6400 3950 6500 3950
Wire Wire Line
	6500 3600 6400 3600
Wire Wire Line
	6500 3250 6400 3250
Wire Wire Line
	6500 2900 6400 2900
$Comp
L lpc_LPC54616J512:KeyMatrix U7
U 1 1 5BFA2E1B
P 7100 4700
F 0 "U7" H 7528 4688 50  0000 L CNN
F 1 "KeyMatrix" H 7528 4597 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x08_P2.54mm_Vertical" H 7100 4700 50  0001 C CNN
F 3 "" H 7100 4700 50  0001 C CNN
F 4 "ali" H 0   0   50  0001 C CNN "notes"
	1    7100 4700
	1    0    0    -1  
$EndComp
Wire Wire Line
	6600 4400 5550 4400
Wire Wire Line
	5550 4500 6600 4500
Wire Wire Line
	6600 4600 5550 4600
Wire Wire Line
	5550 4700 6600 4700
Wire Wire Line
	7000 5200 6300 5200
Wire Wire Line
	6300 5200 6300 4800
Wire Wire Line
	6300 4800 5550 4800
Wire Wire Line
	5550 4900 6200 4900
Wire Wire Line
	6200 4900 6200 5300
Wire Wire Line
	6200 5300 7100 5300
Wire Wire Line
	7100 5300 7100 5200
Wire Wire Line
	7200 5200 7200 5400
Wire Wire Line
	7200 5400 6100 5400
Wire Wire Line
	6100 5400 6100 5000
Wire Wire Line
	6100 5000 5550 5000
Wire Wire Line
	7300 5200 7300 5500
Wire Wire Line
	7300 5500 3550 5500
Wire Wire Line
	3550 5500 3550 4650
Wire Wire Line
	3550 4650 3650 4650
NoConn ~ 4600 2000
NoConn ~ 3650 3750
NoConn ~ 3650 3850
NoConn ~ 3650 3950
Wire Wire Line
	5350 1750 5350 2800
NoConn ~ 4600 2200
$Comp
L canbox-rescue:Screw_Terminal_01x02-Connector J2
U 1 1 5C147E9B
P 7350 1400
AR Path="/5C147E9B" Ref="J2"  Part="1" 
AR Path="/5CA6EA6B/5C147E9B" Ref="J2"  Part="1" 
F 0 "J2" H 7430 1392 50  0000 L CNN
F 1 "Screw_Terminal_01x02" H 7430 1301 50  0000 L CNN
F 2 "TerminalBlock_Phoenix:TerminalBlock_Phoenix_MPT-0,5-2-2.54_1x02_P2.54mm_Horizontal" H 7350 1400 50  0001 C CNN
F 3 "~" H 7350 1400 50  0001 C CNN
F 4 "282834-2" H 0   0   50  0001 C CNN "OP"
F 5 "282834-2" H 0   0   50  0001 C CNN "Arrow"
F 6 "282834-2" H 0   0   50  0001 C CNN "DigiKez"
	1    7350 1400
	1    0    0    -1  
$EndComp
Wire Wire Line
	5900 1150 5900 1050
Wire Wire Line
	5900 1050 7150 1050
Wire Wire Line
	7150 1050 7150 1400
Wire Wire Line
	7150 1500 7150 1750
Wire Wire Line
	7150 1750 5900 1750
$Comp
L canbox-rescue:C-Device C15
U 1 1 5C17145F
P 4100 1000
F 0 "C15" H 4215 1046 50  0000 L CNN
F 1 "100n" H 4215 955 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4138 850 50  0001 C CNN
F 3 "~" H 4100 1000 50  0001 C CNN
F 4 "C0805C103K1RACTU" H 4100 1000 50  0001 C CNN "OP"
F 5 "ali" H 450 -50 50  0001 C CNN "notes"
	1    4100 1000
	1    0    0    -1  
$EndComp
Wire Wire Line
	3650 1200 4100 1200
Wire Wire Line
	4100 1200 4100 1150
Connection ~ 3650 1200
Wire Wire Line
	4100 850  4100 800 
Connection ~ 4100 800 
Wire Wire Line
	4100 800  4600 800 
$EndSCHEMATC
