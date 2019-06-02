EESchema Schematic File Version 4
LIBS:canbox-cache
EELAYER 29 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 5 6
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L canbox-rescue:USB_B_Micro-Connector J7
U 1 1 5BDA6E1E
P 7950 1200
F 0 "J7" H 8007 1667 50  0000 C CNN
F 1 "USB_B_Micro" H 8007 1576 50  0000 C CNN
F 2 "cypress:MicroUsb" H 8100 1150 50  0001 C CNN
F 3 "~" H 8100 1150 50  0001 C CNN
F 4 "1050170001" H 7950 1200 50  0001 C CNN "OP"
F 5 "ali" H 0   0   50  0001 C CNN "notes"
	1    7950 1200
	-1   0    0    -1  
$EndComp
Wire Wire Line
	3550 3550 3550 3500
$Comp
L canbox-rescue:CP-Device C51
U 1 1 5BDAD7F5
P 6700 3850
F 0 "C51" H 6818 3896 50  0000 L CNN
F 1 "22u" H 6818 3805 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 6738 3700 50  0001 C CNN
F 3 "~" H 6700 3850 50  0001 C CNN
F 4 "C0805C224Z3VACTU" H 0   0   50  0001 C CNN "OP"
F 5 "ali" H 0   0   50  0001 C CNN "notes"
	1    6700 3850
	1    0    0    -1  
$EndComp
Wire Wire Line
	6400 4200 6400 4350
Wire Wire Line
	6400 4350 6550 4350
Wire Wire Line
	6700 4350 6700 4000
Wire Wire Line
	6400 3450 6700 3450
Connection ~ 6400 3450
Wire Wire Line
	6400 3500 6400 3450
Wire Wire Line
	6700 3450 6700 3700
$Comp
L canbox-rescue:C-Device C49
U 1 1 5BDB25E5
P 6000 3650
F 0 "C49" H 6115 3696 50  0000 L CNN
F 1 "100n" H 6115 3605 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 6038 3500 50  0001 C CNN
F 3 "~" H 6000 3650 50  0001 C CNN
F 4 "C0805C103K1RACTU" H 0   0   50  0001 C CNN "OP"
F 5 "ali" H 0   0   50  0001 C CNN "notes"
	1    6000 3650
	1    0    0    -1  
$EndComp
Wire Wire Line
	5950 3450 6000 3450
Wire Wire Line
	6000 3500 6000 3450
Wire Wire Line
	6000 3450 6400 3450
Connection ~ 6000 3450
$Comp
L canbox-rescue:GND-power #PWR052
U 1 1 5BDB741A
P 6550 4350
F 0 "#PWR052" H 6550 4100 50  0001 C CNN
F 1 "GND" H 6555 4177 50  0000 C CNN
F 2 "" H 6550 4350 50  0001 C CNN
F 3 "" H 6550 4350 50  0001 C CNN
	1    6550 4350
	-1   0    0    -1  
$EndComp
Connection ~ 6550 4350
Wire Wire Line
	6550 4350 6700 4350
Text Label 6500 3450 0    50   ~ 0
3V3
Connection ~ 6700 3450
Connection ~ 3550 3500
Text HLabel 10300 3450 2    50   Output ~ 0
3V3
Text HLabel 9450 2750 2    50   Output ~ 0
5V
Wire Wire Line
	6700 3450 7250 3450
$Comp
L canbox-rescue:PRTR5V0U2X-Power_Protection D1
U 1 1 5BE2B663
P 5150 2200
AR Path="/5BE2B663" Ref="D1"  Part="1" 
AR Path="/5BDA6772/5BE2B663" Ref="D1"  Part="1" 
F 0 "D1" H 5694 2246 50  0000 L CNN
F 1 "PRTR5V0U2X" H 5694 2155 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-143" H 5210 2200 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/PRTR5V0U2X.pdf" H 5210 2200 50  0001 C CNN
F 4 "PRTR5V0U2X,215" H 5150 2200 50  0001 C CNN "OP"
F 5 "ali" H 0   0   50  0001 C CNN "notes"
	1    5150 2200
	1    0    0    -1  
$EndComp
$Comp
L canbox-rescue:L-Device L8
U 1 1 5BE47D39
P 5800 3450
F 0 "L8" V 5990 3450 50  0000 C CNN
F 1 "10uH" V 5899 3450 50  0000 C CNN
F 2 "Inductor_SMD:L_7.25x6.5_H3" H 5800 3450 50  0001 C CNN
F 3 "~" H 5800 3450 50  0001 C CNN
F 4 "ECS-MPIL0630-100MC" H 0   0   50  0001 C CNN "OP"
F 5 "ECS-MPIL0630-100MC" H 0   0   50  0001 C CNN "Arrow"
F 6 "XC2407CT-ND " H 0   0   50  0001 C CNN "DigiKez"
	1    5800 3450
	0    -1   -1   0   
$EndComp
$Comp
L lpc_LPC54616J512:MP1582 U11
U 1 1 5BE2A96B
P 4650 3750
F 0 "U11" H 4650 4381 50  0000 C CNN
F 1 "MP1582" H 4650 4290 50  0000 C CNN
F 2 "Package_SO:SOIC-8-1EP_3.9x4.9mm_P1.27mm_EP2.35x2.35mm" H 4250 4100 50  0001 C CNN
F 3 "" H 4250 4100 50  0001 C CNN
F 4 "ali" H 0   0   50  0001 C CNN "notes"
	1    4650 3750
	1    0    0    -1  
$EndComp
Wire Wire Line
	3550 3500 3950 3500
$Comp
L canbox-rescue:R-Device R24
U 1 1 5BE3B678
P 3950 3650
F 0 "R24" H 4020 3696 50  0000 L CNN
F 1 "100k" H 4020 3605 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 3880 3650 50  0001 C CNN
F 3 "~" H 3950 3650 50  0001 C CNN
F 4 "CR0805-JW-104ELFCT-ND" H 0   0   50  0001 C CNN "OP"
F 5 "stock" H 0   0   50  0001 C CNN "Arrow"
F 6 "stok" H 0   0   50  0001 C CNN "notes"
	1    3950 3650
	1    0    0    -1  
$EndComp
Connection ~ 3950 3500
Wire Wire Line
	3950 3500 4150 3500
Wire Wire Line
	4150 3700 4150 3800
Wire Wire Line
	4150 3800 3950 3800
$Comp
L canbox-rescue:R-Device R25
U 1 1 5BE3E388
P 3950 4100
F 0 "R25" H 4020 4146 50  0000 L CNN
F 1 "200k" H 4020 4055 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 3880 4100 50  0001 C CNN
F 3 "~" H 3950 4100 50  0001 C CNN
F 4 "RMCF0805JT200K" H 0   0   50  0001 C CNN "OP"
F 5 "ok" H 0   0   50  0001 C CNN "Mouser"
F 6 "ok" H 0   0   50  0001 C CNN "notes"
	1    3950 4100
	1    0    0    -1  
$EndComp
Wire Wire Line
	4150 3950 3950 3950
$Comp
L canbox-rescue:GND-power #PWR043
U 1 1 5BE3FE91
P 3950 4350
F 0 "#PWR043" H 3950 4100 50  0001 C CNN
F 1 "GND" H 3955 4177 50  0000 C CNN
F 2 "" H 3950 4350 50  0001 C CNN
F 3 "" H 3950 4350 50  0001 C CNN
	1    3950 4350
	1    0    0    -1  
$EndComp
Wire Wire Line
	3950 4350 3950 4250
$Comp
L canbox-rescue:B340-Diode D5
U 1 1 5BE4309A
P 5650 3600
F 0 "D5" V 5696 3521 50  0000 R CNN
F 1 "B340" V 5605 3521 50  0000 R CNN
F 2 "Diode_SMD:D_SMC" H 5650 3425 50  0001 C CNN
F 3 "http://www.jameco.com/Jameco/Products/ProdDS/1538777.pdf" H 5650 3600 50  0001 C CNN
F 4 "B340AE-13" H 0   0   50  0001 C CNN "OP"
F 5 "B340AE-13" H 0   0   50  0001 C CNN "Arrow"
F 6 "B340AE-13" H 0   0   50  0001 C CNN "DigiKez"
	1    5650 3600
	0    -1   -1   0   
$EndComp
Wire Wire Line
	6000 4150 5800 4150
Wire Wire Line
	5650 4150 5650 3750
Wire Wire Line
	6000 3800 6000 4150
Wire Wire Line
	5150 3450 5300 3450
Connection ~ 5650 3450
$Comp
L canbox-rescue:R-Device R30
U 1 1 5BE4C7F1
P 6400 3650
F 0 "R30" H 6470 3696 50  0000 L CNN
F 1 "124k" H 6470 3605 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 6330 3650 50  0001 C CNN
F 3 "~" H 6400 3650 50  0001 C CNN
F 4 "RMCF0805FT124K" H 0   0   50  0001 C CNN "OP"
F 5 "ok" H 0   0   50  0001 C CNN "Mouser"
F 6 "ok" H 0   0   50  0001 C CNN "notes"
	1    6400 3650
	1    0    0    -1  
$EndComp
$Comp
L canbox-rescue:R-Device R31
U 1 1 5BE4DA01
P 6400 4050
F 0 "R31" H 6470 4096 50  0000 L CNN
F 1 "40.2k" H 6470 4005 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 6330 4050 50  0001 C CNN
F 3 "~" H 6400 4050 50  0001 C CNN
F 4 "ERJ-6ENF4022V" H 0   0   50  0001 C CNN "OP"
F 5 "ok" H 0   0   50  0001 C CNN "Mouser"
F 6 "ok" H 0   0   50  0001 C CNN "notes"
	1    6400 4050
	1    0    0    -1  
$EndComp
Wire Wire Line
	6400 3900 6400 3850
Wire Wire Line
	5450 3700 5450 3850
Wire Wire Line
	5450 3850 6400 3850
Connection ~ 6400 3850
Wire Wire Line
	6400 3850 6400 3800
Wire Wire Line
	5150 3700 5450 3700
Wire Wire Line
	5150 3950 5400 3950
Wire Wire Line
	5400 3950 5400 4100
$Comp
L canbox-rescue:C-Device C47
U 1 1 5BE55CAC
P 5400 4250
F 0 "C47" H 5515 4296 50  0000 L CNN
F 1 "220p" H 5515 4205 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5438 4100 50  0001 C CNN
F 3 "~" H 5400 4250 50  0001 C CNN
F 4 "885012007012" H 0   0   50  0001 C CNN "OP"
F 5 "ali" H 0   0   50  0001 C CNN "notes"
	1    5400 4250
	1    0    0    -1  
$EndComp
$Comp
L canbox-rescue:R-Device R27
U 1 1 5BE56787
P 5400 4650
F 0 "R27" H 5470 4696 50  0000 L CNN
F 1 "68.1k" H 5470 4605 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 5330 4650 50  0001 C CNN
F 3 "~" H 5400 4650 50  0001 C CNN
F 4 "ERJ-6ENF6812V" H 0   0   50  0001 C CNN "OP"
F 5 "ok" H 0   0   50  0001 C CNN "Mouser"
F 6 "ok" H 0   0   50  0001 C CNN "notes"
	1    5400 4650
	1    0    0    -1  
$EndComp
Wire Wire Line
	5400 4500 5400 4400
$Comp
L canbox-rescue:GND-power #PWR049
U 1 1 5BE59C5B
P 5800 4150
F 0 "#PWR049" H 5800 3900 50  0001 C CNN
F 1 "GND" H 5805 3977 50  0000 C CNN
F 2 "" H 5800 4150 50  0001 C CNN
F 3 "" H 5800 4150 50  0001 C CNN
	1    5800 4150
	-1   0    0    -1  
$EndComp
Connection ~ 5800 4150
Wire Wire Line
	5800 4150 5650 4150
$Comp
L canbox-rescue:GND-power #PWR047
U 1 1 5BE5E536
P 5400 4900
F 0 "#PWR047" H 5400 4650 50  0001 C CNN
F 1 "GND" H 5405 4727 50  0000 C CNN
F 2 "" H 5400 4900 50  0001 C CNN
F 3 "" H 5400 4900 50  0001 C CNN
	1    5400 4900
	-1   0    0    -1  
$EndComp
Wire Wire Line
	5400 4900 5400 4800
$Comp
L canbox-rescue:GND-power #PWR045
U 1 1 5BE60E72
P 4650 4300
F 0 "#PWR045" H 4650 4050 50  0001 C CNN
F 1 "GND" H 4655 4127 50  0000 C CNN
F 2 "" H 4650 4300 50  0001 C CNN
F 3 "" H 4650 4300 50  0001 C CNN
	1    4650 4300
	-1   0    0    -1  
$EndComp
Wire Wire Line
	4650 4300 4650 4250
$Comp
L canbox-rescue:C-Device C45
U 1 1 5BE6411F
P 4950 3100
F 0 "C45" H 5065 3146 50  0000 L CNN
F 1 "100n" H 5065 3055 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4988 2950 50  0001 C CNN
F 3 "~" H 4950 3100 50  0001 C CNN
F 4 "C0805C103K1RACTU" H 0   0   50  0001 C CNN "OP"
F 5 "ali" H 0   0   50  0001 C CNN "notes"
	1    4950 3100
	0    1    1    0   
$EndComp
Wire Wire Line
	4800 3100 4700 3100
Wire Wire Line
	4700 3100 4700 3300
Wire Wire Line
	5100 3100 5300 3100
Wire Wire Line
	5300 3100 5300 3450
Connection ~ 5300 3450
Wire Wire Line
	5300 3450 5650 3450
$Comp
L canbox-rescue:1N4148-Diode D3
U 1 1 5BE68854
P 4250 3100
F 0 "D3" H 4250 2884 50  0000 C CNN
F 1 "1N4148" H 4250 2975 50  0000 C CNN
F 2 "Diode_THT:D_DO-35_SOD27_P7.62mm_Horizontal" H 4250 2925 50  0001 C CNN
F 3 "http://www.nxp.com/documents/data_sheet/1N4148_1N4448.pdf" H 4250 3100 50  0001 C CNN
F 4 "1N4148FS-ND" H 4250 3100 50  0001 C CNN "OP"
F 5 "1N4148" H 0   0   50  0001 C CNN "Arrow"
F 6 "1N4148FS-ND" H 0   0   50  0001 C CNN "DigiKez"
	1    4250 3100
	-1   0    0    1   
$EndComp
Wire Wire Line
	4700 3100 4400 3100
Connection ~ 4700 3100
Wire Wire Line
	4100 3100 3550 3100
Wire Wire Line
	3550 3100 3550 3500
$Comp
L lpc_LPC54616J512:LPC54616J512 U1
U 3 1 5BFEB641
P 1500 850
F 0 "U1" H 2350 1015 50  0000 C CNN
F 1 "LPC54616J512" H 2350 924 50  0000 C CNN
F 2 "" H 1550 700 50  0001 C CNN
F 3 "" H 1550 700 50  0001 C CNN
F 4 "nm" H 0   0   50  0001 C CNN "Arrow"
	3    1500 850 
	1    0    0    -1  
$EndComp
$Comp
L canbox-rescue:R-Device R23
U 1 1 5BFF23D5
P 7000 1650
F 0 "R23" H 7070 1696 50  0000 L CNN
F 1 "124k" H 7070 1605 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 6930 1650 50  0001 C CNN
F 3 "~" H 7000 1650 50  0001 C CNN
F 4 "RMCF0805FT124K" H 600 -2000 50  0001 C CNN "OP"
F 5 "ok" H 0   0   50  0001 C CNN "Mouser"
F 6 "ok" H 0   0   50  0001 C CNN "notes"
	1    7000 1650
	1    0    0    -1  
$EndComp
$Comp
L canbox-rescue:R-Device R26
U 1 1 5BFF5AF4
P 7000 2000
F 0 "R26" H 7070 2046 50  0000 L CNN
F 1 "124k" H 7070 1955 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 6930 2000 50  0001 C CNN
F 3 "~" H 7000 2000 50  0001 C CNN
F 4 "RMCF0805FT124K" H 600 -1650 50  0001 C CNN "OP"
F 5 "ok" H 0   0   50  0001 C CNN "Mouser"
F 6 "ok" H 0   0   50  0001 C CNN "notes"
	1    7000 2000
	1    0    0    -1  
$EndComp
Wire Wire Line
	7650 1000 7500 1000
Wire Wire Line
	7000 2700 7800 2700
Wire Wire Line
	7950 2700 7950 1750
Wire Wire Line
	3300 1200 4650 1200
Wire Wire Line
	3300 1300 5650 1300
Wire Wire Line
	6600 1050 6600 1800
Wire Wire Line
	6600 1800 7000 1800
Connection ~ 7000 1800
Wire Wire Line
	7000 1800 7000 1850
Wire Wire Line
	7000 1000 7000 1500
Wire Wire Line
	7650 1400 3300 1400
Wire Wire Line
	5650 2200 5650 1300
Connection ~ 5650 1300
Wire Wire Line
	5650 1300 7650 1300
Wire Wire Line
	4650 2200 4650 1200
Connection ~ 4650 1200
Wire Wire Line
	4650 1200 7650 1200
Wire Wire Line
	5150 1700 5150 900 
Wire Wire Line
	5150 900  7000 900 
Wire Wire Line
	7000 900  7000 1000
Connection ~ 7000 1000
Wire Wire Line
	5150 2700 7000 2700
Wire Wire Line
	7000 2150 7000 2700
Connection ~ 7000 2700
Wire Wire Line
	7500 1000 7500 600 
Wire Wire Line
	7500 600  8900 600 
Wire Wire Line
	8900 600  8900 2750
Wire Wire Line
	8900 2750 9450 2750
Connection ~ 7500 1000
Wire Wire Line
	7500 1000 7000 1000
$Comp
L canbox-rescue:CP-Device C46
U 1 1 5C037742
P 8900 3000
F 0 "C46" H 9018 3046 50  0000 L CNN
F 1 "22u" H 9018 2955 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 8938 2850 50  0001 C CNN
F 3 "~" H 8900 3000 50  0001 C CNN
F 4 "C0805C224Z3VACTU" H 2200 -850 50  0001 C CNN "OP"
F 5 "ali" H 0   0   50  0001 C CNN "notes"
	1    8900 3000
	1    0    0    -1  
$EndComp
Connection ~ 8900 2750
$Comp
L canbox-rescue:GND-power #PWR050
U 1 1 5C03ACDF
P 8900 3200
F 0 "#PWR050" H 8900 2950 50  0001 C CNN
F 1 "GND" H 8905 3027 50  0000 C CNN
F 2 "" H 8900 3200 50  0001 C CNN
F 3 "" H 8900 3200 50  0001 C CNN
	1    8900 3200
	-1   0    0    -1  
$EndComp
Wire Wire Line
	8900 3200 8900 3150
Wire Wire Line
	8900 2750 8900 2850
Wire Wire Line
	3300 1050 6600 1050
Text GLabel 3550 3100 0    50   Input ~ 0
5V
Text GLabel 8900 600  2    50   Input ~ 0
5V
$Comp
L canbox-rescue:C-Device C38
U 1 1 5C07F8EA
P 3550 3700
F 0 "C38" H 3665 3746 50  0000 L CNN
F 1 "100n" H 3665 3655 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3588 3550 50  0001 C CNN
F 3 "~" H 3550 3700 50  0001 C CNN
F 4 "C0805C103K1RACTU" H -2450 50  50  0001 C CNN "OP"
F 5 "ali" H 0   0   50  0001 C CNN "notes"
	1    3550 3700
	1    0    0    -1  
$EndComp
$Comp
L canbox-rescue:GND-power #PWR038
U 1 1 5C0821C5
P 3550 3900
F 0 "#PWR038" H 3550 3650 50  0001 C CNN
F 1 "GND" H 3555 3727 50  0000 C CNN
F 2 "" H 3550 3900 50  0001 C CNN
F 3 "" H 3550 3900 50  0001 C CNN
	1    3550 3900
	-1   0    0    -1  
$EndComp
$Comp
L canbox-rescue:C-Device C36
U 1 1 5C08A48E
P 3150 3650
F 0 "C36" H 3265 3696 50  0000 L CNN
F 1 "4.7u" H 3265 3605 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3188 3500 50  0001 C CNN
F 3 "~" H 3150 3650 50  0001 C CNN
F 4 "CL21A475KOFNNNG" H -2850 0   50  0001 C CNN "OP"
F 5 "ali" H 0   0   50  0001 C CNN "notes"
	1    3150 3650
	1    0    0    -1  
$EndComp
Wire Wire Line
	3150 3500 3550 3500
$Comp
L canbox-rescue:GND-power #PWR035
U 1 1 5C08DC1C
P 3150 3900
F 0 "#PWR035" H 3150 3650 50  0001 C CNN
F 1 "GND" H 3155 3727 50  0000 C CNN
F 2 "" H 3150 3900 50  0001 C CNN
F 3 "" H 3150 3900 50  0001 C CNN
	1    3150 3900
	-1   0    0    -1  
$EndComp
Wire Wire Line
	3150 3900 3150 3800
Wire Wire Line
	3550 3900 3550 3850
Wire Wire Line
	7800 3850 7700 3850
Wire Wire Line
	7700 3850 7700 3450
Connection ~ 7700 3450
Wire Wire Line
	7700 3450 10300 3450
$Comp
L canbox-rescue:TestPoint-Connector TP3
U 1 1 5C14BC8C
P 7800 3850
AR Path="/5C14BC8C" Ref="TP3"  Part="1" 
AR Path="/5BDA6772/5C14BC8C" Ref="TP3"  Part="1" 
F 0 "TP3" V 7754 4038 50  0000 L CNN
F 1 "TestPoint" V 7845 4038 50  0000 L CNN
F 2 "TestPoint:TestPoint_THTPad_1.5x1.5mm_Drill0.7mm" H 8000 3850 50  0001 C CNN
F 3 "~" H 8000 3850 50  0001 C CNN
F 4 "nm" H 0   0   50  0001 C CNN "Arrow"
	1    7800 3850
	0    1    1    0   
$EndComp
Wire Wire Line
	7950 1750 8050 1750
Wire Wire Line
	8050 1750 8050 1600
Connection ~ 7950 1750
Wire Wire Line
	7950 1750 7950 1600
NoConn ~ 3300 1950
NoConn ~ 3300 2100
NoConn ~ 3300 2250
$Comp
L canbox-rescue:R-Device R34
U 1 1 5BFEFD41
P 1100 1300
F 0 "R34" H 1170 1346 50  0000 L CNN
F 1 "12.4k" H 1170 1255 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 1030 1300 50  0001 C CNN
F 3 "~" H 1100 1300 50  0001 C CNN
F 4 "RMCF0805FT12K4" H -2850 -2350 50  0001 C CNN "OP"
F 5 "ok" H 0   0   50  0001 C CNN "Mouser"
F 6 "ok" H 0   0   50  0001 C CNN "notes"
	1    1100 1300
	1    0    0    -1  
$EndComp
Wire Wire Line
	1400 1100 1100 1100
Wire Wire Line
	1100 1100 1100 1150
$Comp
L canbox-rescue:GND-power #PWR0102
U 1 1 5BFFFC35
P 1100 1550
F 0 "#PWR0102" H 1100 1300 50  0001 C CNN
F 1 "GND" H 1105 1377 50  0000 C CNN
F 2 "" H 1100 1550 50  0001 C CNN
F 3 "" H 1100 1550 50  0001 C CNN
	1    1100 1550
	1    0    0    -1  
$EndComp
Wire Wire Line
	1100 1550 1100 1450
$Comp
L canbox-rescue:GND-power #PWR0103
U 1 1 5C01BF9F
P 7800 2700
F 0 "#PWR0103" H 7800 2450 50  0001 C CNN
F 1 "GND" H 7805 2527 50  0000 C CNN
F 2 "" H 7800 2700 50  0001 C CNN
F 3 "" H 7800 2700 50  0001 C CNN
	1    7800 2700
	1    0    0    -1  
$EndComp
Connection ~ 7800 2700
Wire Wire Line
	7800 2700 7950 2700
Wire Wire Line
	4750 4250 4750 4200
Wire Wire Line
	4650 4250 4750 4250
Connection ~ 4650 4250
Wire Wire Line
	4650 4250 4650 4200
Text Label 7250 1200 0    50   ~ 0
D+
Text Label 7250 1300 0    50   ~ 0
D-
Connection ~ 3150 3500
Wire Wire Line
	2600 3500 3150 3500
Wire Wire Line
	5250 6950 5250 6850
Wire Wire Line
	4050 7000 4300 7000
$Comp
L canbox-rescue:TestPoint-Connector TP1
U 1 1 5C163051
P 4050 7000
AR Path="/5C163051" Ref="TP1"  Part="1" 
AR Path="/5BDA6772/5C163051" Ref="TP1"  Part="1" 
F 0 "TP1" H 4108 7118 50  0000 L CNN
F 1 "TestPoint" H 4108 7027 50  0000 L CNN
F 2 "TestPoint:TestPoint_THTPad_1.5x1.5mm_Drill0.7mm" H 4250 7000 50  0001 C CNN
F 3 "~" H 4250 7000 50  0001 C CNN
F 4 "nm" H 0   0   50  0001 C CNN "Arrow"
	1    4050 7000
	1    0    0    -1  
$EndComp
Wire Wire Line
	3400 7500 3400 7400
$Comp
L canbox-rescue:GND-power #PWR037
U 1 1 5C101D3C
P 3400 7500
F 0 "#PWR037" H 3400 7250 50  0001 C CNN
F 1 "GND" H 3405 7327 50  0000 C CNN
F 2 "" H 3400 7500 50  0001 C CNN
F 3 "" H 3400 7500 50  0001 C CNN
	1    3400 7500
	-1   0    0    -1  
$EndComp
Text HLabel 4300 7000 2    50   Output ~ 0
3V3_LC
Connection ~ 4050 7000
Wire Wire Line
	3700 7000 4050 7000
Wire Wire Line
	2700 5550 2600 5550
Wire Wire Line
	2700 5550 2700 6750
Wire Wire Line
	3000 6750 2700 6750
Wire Wire Line
	3000 7000 3000 6750
Wire Wire Line
	3100 7000 3000 7000
Wire Wire Line
	2700 7100 2700 7050
Wire Wire Line
	3100 7100 2700 7100
Connection ~ 2700 6750
$Comp
L canbox-rescue:R-Device R15
U 1 1 5C0D8AEA
P 2700 6900
F 0 "R15" H 2770 6946 50  0000 L CNN
F 1 "100k" H 2770 6855 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 2630 6900 50  0001 C CNN
F 3 "~" H 2700 6900 50  0001 C CNN
F 4 "CR0805-JW-104ELFCT-ND" H -1250 3250 50  0001 C CNN "OP"
F 5 "stock" H 0   0   50  0001 C CNN "Arrow"
F 6 "stok" H 0   0   50  0001 C CNN "notes"
	1    2700 6900
	1    0    0    -1  
$EndComp
$Comp
L canbox-rescue:TLV70233_SOT23-5-Regulator_Linear U6
U 1 1 5C0D54A4
P 3400 7100
F 0 "U6" H 3400 7442 50  0000 C CNN
F 1 "TLV70233_SOT23-5" H 3400 7351 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23-5" H 3400 7425 50  0001 C CIN
F 3 "http://www.ti.com/lit/ds/symlink/tlv702.pdf" H 3400 7150 50  0001 C CNN
F 4 "TLV70230QDBVRQ1" H 0   0   50  0001 C CNN "Arrow"
	1    3400 7100
	1    0    0    -1  
$EndComp
Wire Wire Line
	2600 5550 2600 3500
$Comp
L canbox-rescue:GND-power #PWR041
U 1 1 5C045BB1
P 5250 6950
F 0 "#PWR041" H 5250 6700 50  0001 C CNN
F 1 "GND" H 5255 6777 50  0000 C CNN
F 2 "" H 5250 6950 50  0001 C CNN
F 3 "" H 5250 6950 50  0001 C CNN
	1    5250 6950
	-1   0    0    -1  
$EndComp
$Comp
L canbox-rescue:CP-Device C16
U 1 1 5C1C11D9
P 7250 3800
F 0 "C16" H 7368 3846 50  0000 L CNN
F 1 "47uF" H 7368 3755 50  0000 L CNN
F 2 "Capacitor_Tantalum_SMD:CP_EIA-3528-21_Kemet-B_Pad1.50x2.35mm_HandSolder" H 7288 3650 50  0001 C CNN
F 3 "~" H 7250 3800 50  0001 C CNN
F 4 "" H 550 -50 50  0001 C CNN "OP"
F 5 "ali" H 550 -50 50  0001 C CNN "notes"
	1    7250 3800
	1    0    0    -1  
$EndComp
Wire Wire Line
	7250 3650 7250 3450
Connection ~ 7250 3450
Wire Wire Line
	7250 3450 7700 3450
Wire Wire Line
	6700 4350 7250 4350
Wire Wire Line
	7250 4350 7250 3950
Connection ~ 6700 4350
$EndSCHEMATC
