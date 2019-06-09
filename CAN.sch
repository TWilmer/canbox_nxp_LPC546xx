EESchema Schematic File Version 4
LIBS:canbox-cache
EELAYER 29 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 4 6
Title "CANBOX LPC546xx - CAN"
Date "2019-06-02"
Rev "1"
Comp "Thorsten Wilmer"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L canbox-rescue:Varistor-Device RV1
U 1 1 5C690F71
P 8700 2950
F 0 "RV1" H 8803 2996 50  0000 L CNN
F 1 "B72510E0200K062" V 8200 2500 50  0001 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 8630 2950 50  0001 C CNN
F 3 "~" H 8700 2950 50  0001 C CNN
F 4 "B72510E0200K062" H 400 -350 50  0001 C CNN "OP"
F 5 "B72510E0200K062" H 0   0   50  0001 C CNN "Arrow"
F 6 "495-4607-1-ND " H 0   0   50  0001 C CNN "DigiKez"
	1    8700 2950
	1    0    0    -1  
$EndComp
$Comp
L canbox-rescue:Varistor-Device RV3
U 1 1 5C690F77
P 9200 2950
F 0 "RV3" H 9303 2996 50  0000 L CNN
F 1 "B72510E0200K062" V 9050 2500 50  0001 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 9130 2950 50  0001 C CNN
F 3 "~" H 9200 2950 50  0001 C CNN
F 4 "B72510E0200K062" H 400 -350 50  0001 C CNN "OP"
F 5 "B72510E0200K062" H 0   0   50  0001 C CNN "Arrow"
F 6 "495-4607-1-ND " H 0   0   50  0001 C CNN "DigiKez"
	1    9200 2950
	1    0    0    -1  
$EndComp
$Comp
L canbox-rescue:DLW43MH201XK2L-cypress L5
U 1 1 5C690F7D
P 7850 2650
F 0 "L5" H 7850 2931 50  0000 C CNN
F 1 "DLW43MH201XK2L" H 7850 2840 50  0000 C CNN
F 2 "cypress:DLW43MH201XK2L" H 7850 2650 50  0001 C CNN
F 3 "~" H 7850 2650 50  0001 C CNN
F 4 "DLW43MH201XK2L" H 400 -350 50  0001 C CNN "OP"
F 5 "DLW43MH201XK2L" H 0   0   50  0001 C CNN "Arrow"
F 6 "490-14325-1-ND  " H 0   0   50  0001 C CNN "DigiKez"
	1    7850 2650
	-1   0    0    -1  
$EndComp
$Comp
L canbox-rescue:DB9_Male-Connector J5
U 1 1 5C690F83
P 10700 3750
AR Path="/5C690F83" Ref="J5"  Part="1" 
AR Path="/5BDA19BB/5C690F83" Ref="J5"  Part="1" 
F 0 "J5" V 10572 4305 50  0000 L CNN
F 1 "DB9_Male" V 10663 4305 50  0000 L CNN
F 2 "Connector_Dsub:DSUB-9_Female_Horizontal_P2.77x2.84mm_EdgePinOffset9.90mm_Housed_MountingHolesOffset11.32mm" H 10700 3750 50  0001 C CNN
F 3 " ~" H 10700 3750 50  0001 C CNN
F 4 "190-009-163R001" H 950 250 50  0001 C CNN "OP"
F 5 "ali" H 0   0   50  0001 C CNN "notes"
	1    10700 3750
	1    0    0    1   
$EndComp
Wire Wire Line
	8200 2550 8050 2550
Wire Wire Line
	8700 2800 8700 2750
Wire Wire Line
	8050 2750 8450 2750
Connection ~ 8700 2750
$Comp
L canbox-rescue:GND-power #PWR034
U 1 1 5C690F9C
P 9200 3300
F 0 "#PWR034" H 9200 3050 50  0001 C CNN
F 1 "GND" H 9205 3127 50  0000 C CNN
F 2 "" H 9200 3300 50  0001 C CNN
F 3 "" H 9200 3300 50  0001 C CNN
	1    9200 3300
	1    0    0    -1  
$EndComp
Wire Wire Line
	9200 3300 9200 3200
Wire Wire Line
	9200 3200 8700 3200
Wire Wire Line
	8700 3200 8700 3100
Connection ~ 9200 3200
Wire Wire Line
	9200 3200 9200 3100
Text Label 9500 2750 0    50   ~ 0
CAN_L
Text Label 9500 2550 0    50   ~ 0
CAN_H
Wire Wire Line
	7650 2550 7300 2550
Wire Wire Line
	7300 2550 7300 2350
Wire Wire Line
	7300 2350 6850 2350
Wire Wire Line
	6850 2550 7150 2550
Wire Wire Line
	7150 2550 7150 2750
Wire Wire Line
	7150 2750 7650 2750
$Comp
L canbox-rescue:+5V-power #PWR030
U 1 1 5C698AF5
P 6350 1600
AR Path="/5C698AF5" Ref="#PWR030"  Part="1" 
AR Path="/5BDA19BB/5C698AF5" Ref="#PWR030"  Part="1" 
F 0 "#PWR030" H 6350 1450 50  0001 C CNN
F 1 "+5V" V 6300 1650 50  0000 C CNN
F 2 "" H 6350 1600 50  0001 C CNN
F 3 "" H 6350 1600 50  0001 C CNN
	1    6350 1600
	1    0    0    -1  
$EndComp
Wire Wire Line
	6350 2050 6350 1700
Text HLabel 850  1500 0    50   Input ~ 0
5V
$Comp
L canbox-rescue:+5V-power #PWR027
U 1 1 5C9B2D1A
P 1550 1400
AR Path="/5C9B2D1A" Ref="#PWR027"  Part="1" 
AR Path="/5BDA19BB/5C9B2D1A" Ref="#PWR027"  Part="1" 
F 0 "#PWR027" H 1550 1250 50  0001 C CNN
F 1 "+5V" V 1500 1450 50  0000 C CNN
F 2 "" H 1550 1400 50  0001 C CNN
F 3 "" H 1550 1400 50  0001 C CNN
	1    1550 1400
	1    0    0    -1  
$EndComp
Wire Wire Line
	850  1500 1000 1500
Wire Wire Line
	1550 1500 1550 1400
$Comp
L lpc_LPC54616J512:LPC54616J512 U1
U 8 1 5C36E5CA
P 2050 1950
F 0 "U1" H 3612 1875 50  0000 C CNN
F 1 "LPC54616J512" H 3612 1784 50  0000 C CNN
F 2 "Package_QFP:LQFP-100_14x14mm_P0.5mm" H 2100 1800 50  0001 C CNN
F 3 "" H 2100 1800 50  0001 C CNN
F 4 "LPC54616J512BD100E" H 0   0   50  0001 C CNN "OP"
F 5 "nm" H 0   0   50  0001 C CNN "Arrow"
	8    2050 1950
	1    0    0    -1  
$EndComp
$Comp
L canbox-rescue:R-Device R13
U 1 1 5C3A3929
P 7900 3000
F 0 "R13" V 8107 3000 50  0000 C CNN
F 1 "nm" V 8016 3000 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 7830 3000 50  0001 C CNN
F 3 "~" H 7900 3000 50  0001 C CNN
	1    7900 3000
	0    -1   -1   0   
$EndComp
$Comp
L canbox-rescue:R-Device R12
U 1 1 5C3A6AAB
P 7850 2250
F 0 "R12" V 8057 2250 50  0000 C CNN
F 1 "nm" V 7966 2250 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 7780 2250 50  0001 C CNN
F 3 "~" H 7850 2250 50  0001 C CNN
	1    7850 2250
	0    -1   -1   0   
$EndComp
$Comp
L canbox-rescue:R-Device R16
U 1 1 5C3B1DC6
P 8200 3050
F 0 "R16" H 8270 3096 50  0000 L CNN
F 1 "62" H 8270 3005 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 8130 3050 50  0001 C CNN
F 3 "~" H 8200 3050 50  0001 C CNN
F 4 "ERJ-6ENF59R0V" H 400 -350 50  0001 C CNN "OP"
F 5 "ok" H 0   0   50  0001 C CNN "Mouser"
F 6 "ok" H 0   0   50  0001 C CNN "notes"
	1    8200 3050
	1    0    0    -1  
$EndComp
$Comp
L canbox-rescue:R-Device R17
U 1 1 5C3B4F36
P 8450 3050
F 0 "R17" H 8520 3096 50  0000 L CNN
F 1 "62" H 8520 3005 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 8380 3050 50  0001 C CNN
F 3 "~" H 8450 3050 50  0001 C CNN
F 4 "ERJ-6ENF59R0V" H 400 -350 50  0001 C CNN "OP"
F 5 "ok" H 0   0   50  0001 C CNN "Mouser"
F 6 "ok" H 0   0   50  0001 C CNN "notes"
	1    8450 3050
	1    0    0    -1  
$EndComp
Wire Wire Line
	1450 1600 1450 1500
Connection ~ 1450 1500
Wire Wire Line
	1450 1500 1550 1500
$Comp
L canbox-rescue:GND-power #PWR026
U 1 1 5C3BF432
P 1450 2000
F 0 "#PWR026" H 1450 1750 50  0001 C CNN
F 1 "GND" H 1455 1827 50  0000 C CNN
F 2 "" H 1450 2000 50  0001 C CNN
F 3 "" H 1450 2000 50  0001 C CNN
	1    1450 2000
	1    0    0    -1  
$EndComp
Wire Wire Line
	1450 1900 1450 2000
$Comp
L canbox-rescue:C-Device C40
U 1 1 5C3C3F1C
P 8350 3500
F 0 "C40" H 8465 3546 50  0000 L CNN
F 1 "22n" H 8465 3455 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 8388 3350 50  0001 C CNN
F 3 "~" H 8350 3500 50  0001 C CNN
F 4 "C0805C223K5RACTU" H 400 -350 50  0001 C CNN "OP"
F 5 "ali" H 0   0   50  0001 C CNN "notes"
	1    8350 3500
	1    0    0    -1  
$EndComp
Wire Wire Line
	8200 2900 8200 2550
Connection ~ 8200 2550
Wire Wire Line
	8450 2900 8450 2750
Connection ~ 8450 2750
Wire Wire Line
	8450 2750 8700 2750
Wire Wire Line
	8200 3200 8200 3300
Wire Wire Line
	8200 3300 8350 3300
Wire Wire Line
	8450 3300 8450 3200
Wire Wire Line
	8350 3350 8350 3300
Connection ~ 8350 3300
Wire Wire Line
	8350 3300 8450 3300
Wire Wire Line
	8350 3750 8350 3650
Wire Wire Line
	8050 3000 8050 2750
Connection ~ 8050 2750
Wire Wire Line
	7650 3000 7650 2750
Wire Wire Line
	7650 3000 7750 3000
Connection ~ 7650 2750
Wire Wire Line
	7650 2550 7650 2250
Wire Wire Line
	7650 2250 7700 2250
Connection ~ 7650 2550
Wire Wire Line
	8000 2250 8200 2250
Wire Wire Line
	8200 2250 8200 2550
$Comp
L canbox-rescue:TJA1051T-Interface_CAN_LIN U5
U 1 1 5BF1E24D
P 6350 2450
F 0 "U5" H 6350 3031 50  0000 C CNN
F 1 "TJA1051T" H 6350 2940 50  0000 C CNN
F 2 "Package_SO:SOIC-8_3.9x4.9mm_P1.27mm" H 6350 1950 50  0001 C CIN
F 3 "http://www.nxp.com/documents/data_sheet/TJA1051.pdf" H 6350 2450 50  0001 C CNN
F 4 "ali" H 0   0   50  0001 C CNN "notes"
	1    6350 2450
	1    0    0    -1  
$EndComp
Wire Wire Line
	8200 2550 9200 2550
Wire Wire Line
	10400 3750 9600 3750
Wire Wire Line
	9600 3750 9600 3450
Wire Wire Line
	9600 3450 10400 3450
Wire Wire Line
	9600 3750 9600 3950
Connection ~ 9600 3750
$Comp
L canbox-rescue:GND-power #PWR031
U 1 1 5BF9FDC8
P 9600 3950
F 0 "#PWR031" H 9600 3700 50  0001 C CNN
F 1 "GND" H 9605 3777 50  0000 C CNN
F 2 "" H 9600 3950 50  0001 C CNN
F 3 "" H 9600 3950 50  0001 C CNN
	1    9600 3950
	1    0    0    -1  
$EndComp
Wire Wire Line
	3850 2250 5850 2250
Wire Wire Line
	3850 2350 5850 2350
Wire Wire Line
	5850 2650 5300 2650
Wire Wire Line
	5300 2650 5300 2450
Wire Wire Line
	3850 2450 5300 2450
Wire Wire Line
	6350 2850 6350 3000
$Comp
L canbox-rescue:GND-power #PWR025
U 1 1 5BFC7A94
P 6350 3000
F 0 "#PWR025" H 6350 2750 50  0001 C CNN
F 1 "GND" H 6355 2827 50  0000 C CNN
F 2 "" H 6350 3000 50  0001 C CNN
F 3 "" H 6350 3000 50  0001 C CNN
	1    6350 3000
	1    0    0    -1  
$EndComp
$Comp
L canbox-rescue:C-Device C12
U 1 1 5BFCABB0
P 1000 1750
F 0 "C12" H 1115 1796 50  0000 L CNN
F 1 "100n" H 1115 1705 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1038 1600 50  0001 C CNN
F 3 "~" H 1000 1750 50  0001 C CNN
F 4 "C0805C103K1RACTU" H -450 0   50  0001 C CNN "OP"
F 5 "ali" H 0   0   50  0001 C CNN "notes"
	1    1000 1750
	1    0    0    -1  
$EndComp
Wire Wire Line
	1000 1600 1000 1500
Connection ~ 1000 1500
Wire Wire Line
	1000 1500 1450 1500
Wire Wire Line
	1450 1900 1000 1900
NoConn ~ 10400 3950
NoConn ~ 10400 4050
NoConn ~ 10400 4150
$Comp
L canbox-rescue:GND-power #PWR0105
U 1 1 5C0835E8
P 8350 3750
F 0 "#PWR0105" H 8350 3500 50  0001 C CNN
F 1 "GND" H 8355 3577 50  0000 C CNN
F 2 "" H 8350 3750 50  0001 C CNN
F 3 "" H 8350 3750 50  0001 C CNN
	1    8350 3750
	1    0    0    -1  
$EndComp
Wire Wire Line
	8700 2750 9950 2750
Wire Wire Line
	9200 2800 9200 2550
Connection ~ 9200 2550
Wire Wire Line
	9200 2550 10150 2550
NoConn ~ 3850 2900
NoConn ~ 3850 2800
NoConn ~ 3850 2700
$Comp
L canbox-rescue:R-Device R11
U 1 1 5CFFAE5F
P 5450 1950
F 0 "R11" H 5520 1996 50  0000 L CNN
F 1 "NC" H 5520 1905 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 5380 1950 50  0001 C CNN
F 3 "" H 5450 1950 50  0001 C CNN
	1    5450 1950
	1    0    0    -1  
$EndComp
Wire Wire Line
	5850 2550 5450 2550
Wire Wire Line
	5450 2550 5450 2100
Wire Wire Line
	5450 1800 5450 1700
Wire Wire Line
	5450 1700 6350 1700
Connection ~ 6350 1700
Wire Wire Line
	6350 1700 6350 1600
Wire Wire Line
	10400 3550 9950 3550
Wire Wire Line
	9950 2750 9950 3550
NoConn ~ 10400 3350
Wire Wire Line
	10400 3650 10150 3650
Wire Wire Line
	10150 3650 10150 2550
NoConn ~ 10400 3850
Text Notes 5600 2400 0    50   ~ 0
<-
Text Notes 5650 2250 0    50   ~ 0
->
$EndSCHEMATC
