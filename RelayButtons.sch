EESchema Schematic File Version 5
LIBS:canbox-cache
EELAYER 30 0
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
Comment5 ""
Comment6 ""
Comment7 ""
Comment8 ""
Comment9 ""
$EndDescr
Text HLabel 3250 800  0    50   Input ~ 0
5V
Wire Wire Line
	3250 800  3650 800 
Wire Wire Line
	3650 900  3650 800 
Connection ~ 3650 800 
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
F 6 "C45783 " H 3650 1050 50  0001 C CNN "JLC"
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
Wire Wire Line
	3650 1200 4100 1200
Connection ~ 3650 1200
NoConn ~ 3650 4950
Wire Wire Line
	3800 2600 3400 2600
Wire Wire Line
	2800 2500 3500 2500
Wire Wire Line
	3800 2400 3650 2400
NoConn ~ 3650 4850
NoConn ~ 3650 3950
NoConn ~ 3650 3850
$Comp
L lpc_LPC54616J512:LPC54616J512 U1
U 4 1 5EC46C80
P 1000 1600
F 0 "U1" H 1850 1765 50  0000 C CNN
F 1 "LPC54616J512" H 1850 1674 50  0000 C CNN
F 2 "" H 1050 1450 50  0001 C CNN
F 3 "" H 1050 1450 50  0001 C CNN
F 4 "nm" H -4450 -2050 50  0001 C CNN "Arrow"
	4    1000 1600
	1    0    0    -1  
$EndComp
Wire Wire Line
	3125 2000 3125 1900
Wire Wire Line
	3125 1900 2800 1900
NoConn ~ 3650 3750
$Comp
L Connector_Generic:Conn_02x05_Odd_Even J2
U 1 1 5DFEA52E
P 4550 2350
F 0 "J2" H 4600 2767 50  0000 C CNN
F 1 "Conn_02x05_Odd_Even" H 4600 2676 50  0000 C CNN
F 2 "Connector_PinHeader_1.27mm:PinHeader_2x05_P1.27mm_Vertical_SMD" H 4550 2350 50  0001 C CNN
F 3 "~" H 4550 2350 50  0001 C CNN
	1    4550 2350
	1    0    0    -1  
$EndComp
Wire Wire Line
	5150 800  5150 2150
Wire Wire Line
	5150 2150 4850 2150
Wire Wire Line
	3650 800  5150 800 
Wire Wire Line
	4350 2150 4350 1750
Wire Wire Line
	4350 1750 3950 1750
Text HLabel 3950 1750 0    50   Input ~ 0
3V3
Wire Wire Line
	2800 2050 4000 2050
Wire Wire Line
	4000 2050 4000 2350
Wire Wire Line
	4000 2350 4350 2350
Wire Wire Line
	4200 2000 4200 2250
Wire Wire Line
	4200 2250 4350 2250
Wire Wire Line
	3125 2000 4200 2000
Wire Wire Line
	4350 2450 3900 2450
Wire Wire Line
	3900 2450 3900 2150
Wire Wire Line
	3900 2150 2800 2150
Wire Wire Line
	4350 2550 3850 2550
Wire Wire Line
	3850 2550 3850 2300
Wire Wire Line
	2800 2300 3850 2300
Wire Wire Line
	3400 2600 3400 3050
Wire Wire Line
	3400 3050 5650 3050
Wire Wire Line
	5650 3050 5650 2350
Wire Wire Line
	5650 2350 4850 2350
Connection ~ 3400 2600
Wire Wire Line
	3400 2600 2800 2600
Wire Wire Line
	4850 2450 5500 2450
Wire Wire Line
	5500 2450 5500 2950
Wire Wire Line
	5500 2950 3500 2950
Wire Wire Line
	3500 2950 3500 2500
Connection ~ 3500 2500
Wire Wire Line
	3500 2500 3800 2500
Wire Wire Line
	3650 2400 3650 2850
Wire Wire Line
	3650 2850 5250 2850
Wire Wire Line
	5250 2850 5250 2550
Wire Wire Line
	5250 2550 4850 2550
Connection ~ 3650 2400
Wire Wire Line
	3650 2400 2800 2400
Wire Wire Line
	4850 2250 6150 2250
Wire Wire Line
	6150 2250 6150 3000
$Comp
L power:GND #PWR0104
U 1 1 5DFF6130
P 6150 3000
F 0 "#PWR0104" H 6150 2750 50  0001 C CNN
F 1 "GND" H 6155 2827 50  0000 C CNN
F 2 "" H 6155 2736 50  0000 C CNN
F 3 "" H 6150 3000 50  0001 C CNN
	1    6150 3000
	1    0    0    -1  
$EndComp
$EndSCHEMATC
