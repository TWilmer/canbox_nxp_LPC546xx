EESchema Schematic File Version 5
LIBS:canbox-cache
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 6
Title "CANBOX LPC546xx - MCU"
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
$Comp
L canbox-rescue:C_Small-Device C11
U 1 1 5BDD02D1
P 3400 2600
F 0 "C11" H 3492 2646 50  0000 L CNN
F 1 "100n" H 3492 2555 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3400 2600 50  0001 C CNN
F 3 "~" H 3400 2600 50  0001 C CNN
F 4 "CC0805KRX7R9BB104" H 3400 2600 50  0001 C CNN "OP"
F 5 "ali" H 0   0   50  0001 C CNN "notes"
F 6 " C49678 " H 3400 2600 50  0001 C CNN "JLC"
	1    3400 2600
	1    0    0    -1  
$EndComp
$Comp
L canbox-rescue:C_Small-Device C10
U 1 1 5BDD1387
P 3050 2600
F 0 "C10" H 3142 2646 50  0000 L CNN
F 1 "100n" H 3142 2555 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3050 2600 50  0001 C CNN
F 3 "~" H 3050 2600 50  0001 C CNN
F 4 "CC0805KRX7R9BB104" H 3050 2600 50  0001 C CNN "OP"
F 5 "ali" H 0   0   50  0001 C CNN "notes"
F 6 " C49678 " H 3050 2600 50  0001 C CNN "JLC"
	1    3050 2600
	1    0    0    -1  
$EndComp
$Comp
L canbox-rescue:C_Small-Device C8
U 1 1 5BDD1C68
P 2750 2600
F 0 "C8" H 2842 2646 50  0000 L CNN
F 1 "100n" H 2842 2555 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2750 2600 50  0001 C CNN
F 3 "~" H 2750 2600 50  0001 C CNN
F 4 "CC0805KRX7R9BB104" H 2750 2600 50  0001 C CNN "OP"
F 5 "ali" H 0   0   50  0001 C CNN "notes"
F 6 " C49678 " H 2750 2600 50  0001 C CNN "JLC"
	1    2750 2600
	1    0    0    -1  
$EndComp
$Comp
L canbox-rescue:C_Small-Device C4
U 1 1 5BDD21DC
P 2400 2600
F 0 "C4" H 2492 2646 50  0000 L CNN
F 1 "100n" H 2492 2555 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2400 2600 50  0001 C CNN
F 3 "~" H 2400 2600 50  0001 C CNN
F 4 "CC0805KRX7R9BB104" H 2400 2600 50  0001 C CNN "OP"
F 5 "ali" H 0   0   50  0001 C CNN "notes"
F 6 " C49678 " H 2400 2600 50  0001 C CNN "JLC"
	1    2400 2600
	1    0    0    -1  
$EndComp
$Comp
L canbox-rescue:C_Small-Device C2
U 1 1 5BDD27EA
P 2050 2600
F 0 "C2" H 2142 2646 50  0000 L CNN
F 1 "100n" H 2142 2555 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2050 2600 50  0001 C CNN
F 3 "~" H 2050 2600 50  0001 C CNN
F 4 "CC0805KRX7R9BB104" H 2050 2600 50  0001 C CNN "OP"
F 5 "ali" H 0   0   50  0001 C CNN "notes"
F 6 " C49678 " H 2050 2600 50  0001 C CNN "JLC"
	1    2050 2600
	1    0    0    -1  
$EndComp
Connection ~ 2050 2500
Wire Wire Line
	2050 2500 1900 2500
Connection ~ 2400 2500
Wire Wire Line
	2400 2500 2050 2500
Connection ~ 2750 2500
Wire Wire Line
	2750 2500 2400 2500
Connection ~ 3050 2500
Wire Wire Line
	3050 2500 2750 2500
Connection ~ 3400 2500
Wire Wire Line
	3400 2500 3050 2500
Wire Wire Line
	2050 2700 2400 2700
Connection ~ 2400 2700
Wire Wire Line
	2400 2700 2750 2700
Connection ~ 2750 2700
Wire Wire Line
	2750 2700 2900 2700
Connection ~ 3050 2700
Wire Wire Line
	3050 2700 3400 2700
$Comp
L canbox-rescue:GND-power #PWR04
U 1 1 5BDE39BE
P 2900 2700
F 0 "#PWR04" H 2900 2450 50  0001 C CNN
F 1 "GND" H 2905 2527 50  0000 C CNN
F 2 "" H 2900 2700 50  0001 C CNN
F 3 "" H 2900 2700 50  0001 C CNN
	1    2900 2700
	1    0    0    -1  
$EndComp
Connection ~ 2900 2700
Wire Wire Line
	2900 2700 3050 2700
$Comp
L canbox-rescue:GND-power #PWR05
U 1 1 5BDE404F
P 3550 3200
F 0 "#PWR05" H 3550 2950 50  0001 C CNN
F 1 "GND" H 3555 3027 50  0000 C CNN
F 2 "" H 3550 3200 50  0001 C CNN
F 3 "" H 3550 3200 50  0001 C CNN
	1    3550 3200
	1    0    0    -1  
$EndComp
$Comp
L canbox-rescue:C_Small-Device C7
U 1 1 5BE032F3
P 2700 4500
F 0 "C7" H 2792 4546 50  0000 L CNN
F 1 "22p" H 2792 4455 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2700 4500 50  0001 C CNN
F 3 "~" H 2700 4500 50  0001 C CNN
F 4 "CL21C220JBANNNC" H 2700 4500 50  0001 C CNN "OP"
F 5 "ali" H 0   0   50  0001 C CNN "notes"
F 6 "C1804 " H 2700 4500 50  0001 C CNN "JLC"
	1    2700 4500
	1    0    0    -1  
$EndComp
Wire Wire Line
	2700 4400 3350 4400
Wire Wire Line
	3350 4400 3350 4350
$Comp
L canbox-rescue:GND-power #PWR03
U 1 1 5BE0B62B
P 2700 4600
F 0 "#PWR03" H 2700 4350 50  0001 C CNN
F 1 "GND" H 2705 4427 50  0000 C CNN
F 2 "" H 2700 4600 50  0001 C CNN
F 3 "" H 2700 4600 50  0001 C CNN
	1    2700 4600
	1    0    0    -1  
$EndComp
$Comp
L canbox-rescue:GND-power #PWR02
U 1 1 5BE0C5A1
P 2550 4300
F 0 "#PWR02" H 2550 4050 50  0001 C CNN
F 1 "GND" H 2555 4127 50  0000 C CNN
F 2 "" H 2550 4300 50  0001 C CNN
F 3 "" H 2550 4300 50  0001 C CNN
	1    2550 4300
	1    0    0    -1  
$EndComp
Wire Wire Line
	2550 4300 2550 4250
$Comp
L canbox-rescue:+3.3V-power #PWR01
U 1 1 5BE45EFF
P 1550 2500
AR Path="/5BE45EFF" Ref="#PWR01"  Part="1" 
AR Path="/5BD9E863/5BE45EFF" Ref="#PWR01"  Part="1" 
F 0 "#PWR01" H 1550 2350 50  0001 C CNN
F 1 "+3.3V" H 1565 2673 50  0000 C CNN
F 2 "" H 1550 2500 50  0001 C CNN
F 3 "" H 1550 2500 50  0001 C CNN
	1    1550 2500
	1    0    0    -1  
$EndComp
$Comp
L canbox-rescue:GND-power #PWR07
U 1 1 5C011BEA
P 5900 5600
F 0 "#PWR07" H 5900 5350 50  0001 C CNN
F 1 "GND" H 5905 5427 50  0000 C CNN
F 2 "" H 5900 5600 50  0001 C CNN
F 3 "" H 5900 5600 50  0001 C CNN
	1    5900 5600
	1    0    0    -1  
$EndComp
Wire Wire Line
	7200 1100 7200 950 
Wire Wire Line
	7200 950  7000 950 
$Comp
L canbox-rescue:+3.3V-power #PWR09
U 1 1 5C0919A2
P 7000 950
AR Path="/5C0919A2" Ref="#PWR09"  Part="1" 
AR Path="/5BD9E863/5C0919A2" Ref="#PWR09"  Part="1" 
F 0 "#PWR09" H 7000 800 50  0001 C CNN
F 1 "+3.3V" H 7015 1123 50  0000 C CNN
F 2 "" H 7000 950 50  0001 C CNN
F 3 "" H 7000 950 50  0001 C CNN
	1    7000 950 
	1    0    0    -1  
$EndComp
Connection ~ 7000 950 
Connection ~ 1900 2500
Text HLabel 1900 1350 1    50   Input ~ 0
3V3
Wire Wire Line
	1900 1500 2250 1500
Wire Wire Line
	2250 1500 2250 950 
Wire Wire Line
	2250 950  6400 950 
Connection ~ 1900 1500
Wire Wire Line
	6050 2500 7800 2500
$Comp
L canbox-rescue:R-Device R3
U 1 1 5C068773
P 7200 1250
F 0 "R3" H 7130 1204 50  0000 R CNN
F 1 "124k" H 7130 1295 50  0000 R CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 7130 1250 50  0001 C CNN
F 3 "~" H 7200 1250 50  0001 C CNN
F 4 "0805W8F1243T5E" H 0   0   50  0001 C CNN "OP"
F 5 "stock" H 0   0   50  0001 C CNN "Arrow"
F 6 "stok" H 0   0   50  0001 C CNN "notes"
F 7 "C17440" H 7200 1250 50  0001 C CNN "JLC"
	1    7200 1250
	-1   0    0    1   
$EndComp
$Comp
L canbox-rescue:R-Device R1
U 1 1 5BECD9F1
P 6400 1250
F 0 "R1" H 6330 1204 50  0000 R CNN
F 1 "124k" H 6330 1295 50  0000 R CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 6330 1250 50  0001 C CNN
F 3 "~" H 6400 1250 50  0001 C CNN
F 4 "0805W8F1243T5E" H 0   0   50  0001 C CNN "OP"
F 5 "stock" H 0   0   50  0001 C CNN "Arrow"
F 6 "stok" H 0   0   50  0001 C CNN "notes"
F 7 "C17440" H 6400 1250 50  0001 C CNN "JLC"
	1    6400 1250
	-1   0    0    1   
$EndComp
Wire Wire Line
	6400 950  6400 1100
Connection ~ 6400 950 
Wire Wire Line
	6050 2950 6400 2950
Wire Wire Line
	6050 3250 6550 3250
Wire Wire Line
	1550 2500 1750 2500
$Comp
L canbox-rescue:C_Small-Device C3
U 1 1 5C09026B
P 2950 3100
F 0 "C3" H 3042 3146 50  0000 L CNN
F 1 "100n" H 3042 3055 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2950 3100 50  0001 C CNN
F 3 "~" H 2950 3100 50  0001 C CNN
F 4 "CC0805KRX7R9BB104" H 2950 3100 50  0001 C CNN "OP"
F 5 "ali" H 0   0   50  0001 C CNN "notes"
F 6 " C49678 " H 2950 3100 50  0001 C CNN "JLC"
	1    2950 3100
	1    0    0    -1  
$EndComp
Connection ~ 2950 3000
Connection ~ 2950 3200
$Comp
L canbox-rescue:C_Small-Device C1
U 1 1 5C091057
P 2600 3100
F 0 "C1" H 2692 3146 50  0000 L CNN
F 1 "10n" H 2692 3055 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2600 3100 50  0001 C CNN
F 3 "~" H 2600 3100 50  0001 C CNN
F 4 "CL21B103KBANNNC" H 2600 3100 50  0001 C CNN "OP"
F 5 "ali" H 0   0   50  0001 C CNN "notes"
F 6 "C1710" H 2600 3100 50  0001 C CNN "JLC"
	1    2600 3100
	1    0    0    -1  
$EndComp
Wire Wire Line
	2600 3000 2950 3000
Wire Wire Line
	2600 3200 2950 3200
Wire Wire Line
	3350 4350 4150 4350
Wire Wire Line
	5900 5250 5900 5600
$Comp
L canbox-rescue:Jumper_NC_Small-Device JP1
U 1 1 5F591EE2
P 6450 3450
F 0 "JP1" H 6450 3662 50  0000 C CNN
F 1 "MCD" H 6450 3571 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 6450 3450 50  0001 C CNN
F 3 "~" H 6450 3450 50  0001 C CNN
F 4 "0022284024" H 0   0   50  0001 C CNN "Arrow"
F 5 "22-28-4022" H 0   0   50  0001 C CNN "Mouser"
F 6 "WM50032-02-ND" H 0   0   50  0001 C CNN "OP"
	1    6450 3450
	1    0    0    -1  
$EndComp
Wire Wire Line
	6550 3450 6550 3250
Connection ~ 6550 3250
Wire Wire Line
	6550 3250 7050 3250
$Comp
L canbox-rescue:GND-power #PWR08
U 1 1 5C0EFE58
P 6350 3500
F 0 "#PWR08" H 6350 3250 50  0001 C CNN
F 1 "GND" H 6355 3327 50  0000 C CNN
F 2 "" H 6350 3500 50  0001 C CNN
F 3 "" H 6350 3500 50  0001 C CNN
	1    6350 3500
	1    0    0    -1  
$EndComp
Wire Wire Line
	6350 3500 6350 3450
Text HLabel 1950 3000 0    50   Input ~ 0
3V3_LC
Wire Wire Line
	2950 3000 3350 3000
Wire Wire Line
	2950 3200 3350 3200
Wire Wire Line
	3400 2500 4150 2500
Wire Wire Line
	1900 1500 1900 2500
Wire Wire Line
	1900 1400 1900 1500
Wire Wire Line
	1900 1350 1900 1500
$Comp
L canbox-rescue:C_Small-Device C6
U 1 1 5C144EB1
P 3350 3100
F 0 "C6" H 3442 3146 50  0000 L CNN
F 1 "10n" H 3442 3055 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3350 3100 50  0001 C CNN
F 3 "~" H 3350 3100 50  0001 C CNN
F 4 "CL21A475KAQNNNE" H 3350 3100 50  0001 C CNN "OP"
F 5 "ali" H 0   0   50  0001 C CNN "notes"
F 6 "C1779 " H 3350 3100 50  0001 C CNN "JLC"
	1    3350 3100
	1    0    0    -1  
$EndComp
Connection ~ 3350 3000
Connection ~ 3350 3200
Wire Wire Line
	3350 3200 3550 3200
NoConn ~ 6050 3750
NoConn ~ 6050 3850
NoConn ~ 6050 3950
NoConn ~ 6050 4050
NoConn ~ 6050 4150
Wire Wire Line
	3350 3000 3650 3000
$Comp
L cypress:Conn_ARM_SWD_NXP J1
U 1 1 5C0BD5C3
P 9450 2100
F 0 "J1" H 8920 2089 50  0000 R CNN
F 1 "SWD" H 8920 1998 50  0000 R CNN
F 2 "Connector_PinHeader_1.27mm:PinHeader_2x05_P1.27mm_Vertical_SMD" H 9900 1050 50  0001 L TNN
F 3 "http://infocenter.arm.com/help/topic/com.arm.doc.dui0499b/DUI0499B_system_design_reference.pdf" V 9100 850 50  0001 C CNN
F 4 "ali" H 1400 0   50  0001 C CNN "notes"
	1    9450 2100
	-1   0    0    -1  
$EndComp
Connection ~ 7200 950 
Wire Wire Line
	9550 2900 9550 3050
$Comp
L canbox-rescue:GND-power #PWR0106
U 1 1 5C0DCF09
P 9550 3050
F 0 "#PWR0106" H 9550 2800 50  0001 C CNN
F 1 "GND" H 9555 2877 50  0000 C CNN
F 2 "" H 9550 3050 50  0001 C CNN
F 3 "" H 9550 3050 50  0001 C CNN
	1    9550 3050
	1    0    0    -1  
$EndComp
Wire Wire Line
	7200 950  7800 950 
Wire Wire Line
	7200 2700 7050 2700
Connection ~ 1750 2500
Wire Wire Line
	1750 2500 1900 2500
Wire Wire Line
	2050 2700 1750 2700
Connection ~ 2050 2700
$Comp
L canbox-rescue:R-Device R9
U 1 1 5C45A28F
P 7800 1250
F 0 "R9" H 7730 1204 50  0000 R CNN
F 1 "124k" H 7730 1295 50  0000 R CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 7730 1250 50  0001 C CNN
F 3 "~" H 7800 1250 50  0001 C CNN
F 4 "0805W8F1243T5E" H 600 0   50  0001 C CNN "OP"
F 5 "stock" H 600 0   50  0001 C CNN "Arrow"
F 6 "stok" H 600 0   50  0001 C CNN "notes"
F 7 "C17440" H 7800 1250 50  0001 C CNN "JLC"
	1    7800 1250
	-1   0    0    1   
$EndComp
Wire Wire Line
	7800 1400 7800 2500
Connection ~ 7800 2500
Wire Wire Line
	7800 1100 7800 950 
Connection ~ 7800 950 
Wire Wire Line
	7800 950  9550 950 
$Comp
L canbox-rescue:C_Small-Device C17
U 1 1 5C464560
P 7800 2750
F 0 "C17" H 7892 2796 50  0000 L CNN
F 1 "100n" H 7892 2705 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 7800 2750 50  0001 C CNN
F 3 "~" H 7800 2750 50  0001 C CNN
F 4 "CC0805KRX7R9BB104" H 7800 2750 50  0001 C CNN "OP"
F 5 "ali" H 4400 150 50  0001 C CNN "notes"
F 6 " C49678 " H 7800 2750 50  0001 C CNN "JLC"
	1    7800 2750
	1    0    0    -1  
$EndComp
Wire Wire Line
	7800 2650 7800 2500
$Comp
L canbox-rescue:GND-power #PWR011
U 1 1 5C469E8C
P 7800 3050
F 0 "#PWR011" H 7800 2800 50  0001 C CNN
F 1 "GND" H 7805 2877 50  0000 C CNN
F 2 "" H 7800 3050 50  0001 C CNN
F 3 "" H 7800 3050 50  0001 C CNN
	1    7800 3050
	1    0    0    -1  
$EndComp
Wire Wire Line
	7800 3050 7800 2850
Wire Wire Line
	7200 1400 7200 1700
Wire Wire Line
	8850 1700 7200 1700
Connection ~ 7200 1700
Wire Wire Line
	7200 1700 7200 2700
Wire Wire Line
	7050 2700 7050 3250
Wire Wire Line
	6050 2200 8850 2200
Wire Wire Line
	7800 2500 8850 2500
Wire Wire Line
	6050 2100 8850 2100
Wire Wire Line
	6050 2000 8850 2000
Wire Wire Line
	9550 950  9550 1300
Wire Wire Line
	6400 1400 6400 2950
Wire Wire Line
	3500 4600 3500 4800
$Comp
L canbox-rescue:GND-power #PWR06
U 1 1 5C10D972
P 3500 4800
F 0 "#PWR06" H 3500 4550 50  0001 C CNN
F 1 "GND" H 3505 4627 50  0000 C CNN
F 2 "" H 3500 4800 50  0001 C CNN
F 3 "" H 3500 4800 50  0001 C CNN
	1    3500 4800
	1    0    0    -1  
$EndComp
NoConn ~ 4150 4700
$Comp
L canbox-rescue:C_Small-Device C9
U 1 1 5C16AE5E
P 1750 2600
F 0 "C9" H 1842 2646 50  0000 L CNN
F 1 "4.7u" H 1842 2555 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1750 2600 50  0001 C CNN
F 3 "~" H 1750 2600 50  0001 C CNN
F 4 "CL21A475KAQNNNE" H 1750 2600 50  0001 C CNN "OP"
F 5 "ali" H -1600 -500 50  0001 C CNN "notes"
F 6 "C1779 " H 1750 2600 50  0001 C CNN "JLC"
	1    1750 2600
	1    0    0    -1  
$EndComp
$Comp
L canbox-rescue:C_Small-Device C5
U 1 1 5BDF9B74
P 2550 4150
F 0 "C5" H 2642 4196 50  0000 L CNN
F 1 "22p" H 2642 4105 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2550 4150 50  0001 C CNN
F 3 "~" H 2550 4150 50  0001 C CNN
F 4 "CL21C220JBANNNC" H 2550 4150 50  0001 C CNN "OP"
F 5 "ali" H 0   0   50  0001 C CNN "notes"
F 6 "C1804 " H 2550 4150 50  0001 C CNN "JLC"
	1    2550 4150
	1    0    0    -1  
$EndComp
Wire Wire Line
	6400 950  7000 950 
NoConn ~ 8850 2300
$Comp
L Device:Crystal_GND24_Small Y1
U 1 1 5EB8C909
P 3350 4200
F 0 "Y1" V 3396 4056 50  0000 R CNN
F 1 "12MHZ" V 3305 4056 50  0000 R CNN
F 2 "Crystal:Crystal_SMD_3225-4Pin_3.2x2.5mm_HandSoldering" H 3350 4200 50  0001 C CNN
F 3 "~" H 3350 4200 50  0001 C CNN
F 4 "C9002" H 3350 4200 50  0001 C CNN "JLC"
F 5 "X322512MSB4SI" H 3350 4200 50  0001 C CNN "OP"
	1    3350 4200
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2550 4050 3350 4050
Wire Wire Line
	3350 4100 3350 4050
Connection ~ 3350 4050
Wire Wire Line
	3350 4050 4150 4050
Wire Wire Line
	3350 4300 3350 4350
Connection ~ 3350 4350
Wire Wire Line
	3450 4200 3500 4200
Wire Wire Line
	3500 4200 3500 4600
Wire Wire Line
	3250 4200 3200 4200
Wire Wire Line
	3200 4200 3200 4600
Wire Wire Line
	3200 4600 3500 4600
Connection ~ 3500 4600
Wire Wire Line
	3500 4600 4150 4600
$Comp
L canbox-rescue:C_Small-Device C13
U 1 1 5E9F96CA
P 3650 3100
F 0 "C13" H 3742 3146 50  0000 L CNN
F 1 "4.7u" H 3742 3055 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3650 3100 50  0001 C CNN
F 3 "~" H 3650 3100 50  0001 C CNN
F 4 "CL21A475KAQNNNE" H 3650 3100 50  0001 C CNN "OP"
F 5 "ali" H 300 0   50  0001 C CNN "notes"
F 6 "C1779 " H 3650 3100 50  0001 C CNN "JLC"
	1    3650 3100
	1    0    0    -1  
$EndComp
Connection ~ 3650 3000
Wire Wire Line
	3650 3000 4150 3000
Wire Wire Line
	3650 3200 3550 3200
Connection ~ 3550 3200
$Comp
L canbox-rescue:C_Small-Device C15
U 1 1 5EACD5ED
P 1450 2600
F 0 "C15" H 1542 2646 50  0000 L CNN
F 1 "100n" H 1542 2555 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1450 2600 50  0001 C CNN
F 3 "~" H 1450 2600 50  0001 C CNN
F 4 "CC0805KRX7R9BB104" H 1450 2600 50  0001 C CNN "OP"
F 5 "ali" H -1950 0   50  0001 C CNN "notes"
F 6 " C49678 " H 1450 2600 50  0001 C CNN "JLC"
	1    1450 2600
	1    0    0    -1  
$EndComp
$Comp
L canbox-rescue:C_Small-Device C14
U 1 1 5EAD2D64
P 1100 2600
F 0 "C14" H 1192 2646 50  0000 L CNN
F 1 "100n" H 1192 2555 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1100 2600 50  0001 C CNN
F 3 "~" H 1100 2600 50  0001 C CNN
F 4 "CC0805KRX7R9BB104" H 1100 2600 50  0001 C CNN "OP"
F 5 "ali" H -2300 0   50  0001 C CNN "notes"
F 6 " C49678 " H 1100 2600 50  0001 C CNN "JLC"
	1    1100 2600
	1    0    0    -1  
$EndComp
$Comp
L canbox-rescue:C_Small-Device C26
U 1 1 5EAD5D3A
P 2250 3100
F 0 "C26" H 2342 3146 50  0000 L CNN
F 1 "100n" H 2342 3055 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2250 3100 50  0001 C CNN
F 3 "~" H 2250 3100 50  0001 C CNN
F 4 "CC0805KRX7R9BB104" H 2250 3100 50  0001 C CNN "OP"
F 5 "ali" H -1150 500 50  0001 C CNN "notes"
F 6 " C49678 " H 2250 3100 50  0001 C CNN "JLC"
	1    2250 3100
	1    0    0    -1  
$EndComp
Wire Wire Line
	1950 3000 2250 3000
Connection ~ 2600 3000
Connection ~ 2250 3000
Wire Wire Line
	2250 3000 2600 3000
Wire Wire Line
	2600 3200 2250 3200
Connection ~ 2600 3200
Wire Wire Line
	1750 2700 1450 2700
Connection ~ 1750 2700
Connection ~ 1450 2700
Wire Wire Line
	1450 2700 1100 2700
Wire Wire Line
	1100 2500 1450 2500
Connection ~ 1550 2500
Connection ~ 1450 2500
Wire Wire Line
	1450 2500 1550 2500
Connection ~ 4150 2850
Wire Wire Line
	4150 3000 4150 2850
Wire Wire Line
	4150 2850 4150 2700
Connection ~ 4150 3000
Connection ~ 5900 5250
Connection ~ 4150 1650
Wire Wire Line
	4150 1650 4150 1550
Connection ~ 4500 5250
Wire Wire Line
	4350 5250 4500 5250
Connection ~ 5550 5250
Wire Wire Line
	5400 5250 5550 5250
Connection ~ 4150 2500
Connection ~ 4150 1750
Wire Wire Line
	4150 1750 4150 1650
Wire Wire Line
	4150 1850 4150 1750
Connection ~ 4650 5250
Wire Wire Line
	4500 5250 4650 5250
Wire Wire Line
	4650 5250 4800 5250
Connection ~ 4150 2350
Wire Wire Line
	4150 2350 4150 2250
Wire Wire Line
	4150 2500 4150 2350
Connection ~ 4800 5250
Connection ~ 4150 1850
Connection ~ 4950 5250
Wire Wire Line
	4800 5250 4950 5250
Wire Wire Line
	4950 5250 5100 5250
Connection ~ 4150 1950
Wire Wire Line
	4150 1950 4150 1850
Wire Wire Line
	4150 2050 4150 1950
Connection ~ 5750 5250
Wire Wire Line
	5550 5250 5750 5250
Wire Wire Line
	5750 5250 5900 5250
Connection ~ 5100 5250
Connection ~ 4150 2050
Connection ~ 4150 2150
Wire Wire Line
	4150 2150 4150 2050
Wire Wire Line
	4150 2250 4150 2150
Connection ~ 5250 5250
Wire Wire Line
	5100 5250 5250 5250
Wire Wire Line
	5250 5250 5400 5250
Connection ~ 5400 5250
Connection ~ 4150 2250
$Comp
L lpc_LPC54616J512:LPC54616J512 U1
U 1 1 5BE7F06B
P 4250 1450
F 0 "U1" H 5100 1615 50  0000 C CNN
F 1 "LPC54616J512" H 5100 1524 50  0000 C CNN
F 2 "Package_QFP:LQFP-100_14x14mm_P0.5mm" H 4300 1300 50  0001 C CNN
F 3 "" H 4300 1300 50  0001 C CNN
F 4 "LPC54616J512BD100E" H 0   0   50  0001 C CNN "OP"
F 5 "nm" H 0   0   50  0001 C CNN "Arrow"
	1    4250 1450
	1    0    0    -1  
$EndComp
$EndSCHEMATC
