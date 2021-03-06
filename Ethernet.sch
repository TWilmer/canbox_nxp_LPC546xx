EESchema Schematic File Version 5
LIBS:canbox-cache
EELAYER 30 0
EELAYER END
$Descr A3 16535 11693
encoding utf-8
Sheet 3 6
Title "CANBOX LPC546xx - Ethernet"
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
Text Label 2750 2550 0    50   ~ 0
3V3
$Comp
L canbox-rescue:C-Device C18
U 1 1 5C0F8CFE
P 2950 2750
F 0 "C18" H 3065 2796 50  0000 L CNN
F 1 "100n" H 3065 2705 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2988 2600 50  0001 C CNN
F 3 "~" H 2950 2750 50  0001 C CNN
F 4 "CC0805KRX7R9BB104" H 0   0   50  0001 C CNN "OP"
F 5 "ali" H 0   0   50  0001 C CNN "notes"
F 6 " C49678 " H 2950 2750 50  0001 C CNN "JLC"
	1    2950 2750
	1    0    0    -1  
$EndComp
Wire Wire Line
	2950 2600 2950 2550
Connection ~ 2950 2550
Wire Wire Line
	2950 3000 2950 2900
$Comp
L canbox-rescue:GND-power #PWR015
U 1 1 5C0FE3C6
P 2700 3000
F 0 "#PWR015" H 2700 2750 50  0001 C CNN
F 1 "GND" H 2705 2827 50  0000 C CNN
F 2 "" H 2700 3000 50  0001 C CNN
F 3 "" H 2700 3000 50  0001 C CNN
	1    2700 3000
	1    0    0    -1  
$EndComp
Wire Wire Line
	2700 3000 2950 3000
$Comp
L canbox-rescue:C-Device C30
U 1 1 5C10E831
P 10250 7350
F 0 "C30" V 10502 7350 50  0000 C CNN
F 1 "22p" V 10411 7350 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 10288 7200 50  0001 C CNN
F 3 "~" H 10250 7350 50  0001 C CNN
F 4 "CL21C220JBANNNC" H 300 3300 50  0001 C CNN "OP"
F 5 "ali" H 300 3300 50  0001 C CNN "notes"
F 6 "C1804 " H 10250 7350 50  0001 C CNN "JLC"
	1    10250 7350
	0    -1   -1   0   
$EndComp
$Comp
L canbox-rescue:C-Device C31
U 1 1 5C10F54A
P 10250 7850
F 0 "C31" V 10502 7850 50  0000 C CNN
F 1 "22p" V 10411 7850 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 10288 7700 50  0001 C CNN
F 3 "~" H 10250 7850 50  0001 C CNN
F 4 "CL21C220JBANNNC" H 300 3300 50  0001 C CNN "OP"
F 5 "ali" H 300 3300 50  0001 C CNN "notes"
F 6 "C1804 " H 10250 7850 50  0001 C CNN "JLC"
	1    10250 7850
	0    -1   -1   0   
$EndComp
$Comp
L canbox-rescue:GND-power #PWR022
U 1 1 5C10FC11
P 10500 7600
F 0 "#PWR022" H 10500 7350 50  0001 C CNN
F 1 "GND" V 10505 7472 50  0000 R CNN
F 2 "" H 10500 7600 50  0001 C CNN
F 3 "" H 10500 7600 50  0001 C CNN
	1    10500 7600
	0    -1   -1   0   
$EndComp
Wire Wire Line
	10100 7350 9850 7350
Wire Wire Line
	9850 7350 9850 7400
Wire Wire Line
	10100 7850 9850 7850
Wire Wire Line
	9850 7850 9850 7700
Wire Wire Line
	10400 7850 10400 7600
Wire Wire Line
	10400 7600 10500 7600
Wire Wire Line
	10400 7350 10400 7600
Connection ~ 10400 7600
Text HLabel 1400 2550 0    50   Input ~ 0
3V3
Wire Wire Line
	9300 7400 9850 7400
Wire Wire Line
	9300 7700 9450 7700
$Comp
L canbox-rescue:R-Device R4
U 1 1 5C1E255F
P 7550 5500
F 0 "R4" H 7620 5546 50  0000 L CNN
F 1 "2.49k" H 7620 5455 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 7480 5500 50  0001 C CNN
F 3 "~" H 7550 5500 50  0001 C CNN
F 4 "0805W8F1002T5E" H 3700 -1950 50  0001 C CNN "OP"
F 5 "ok" H 0   0   50  0001 C CNN "Mouser"
F 6 "ok" H 0   0   50  0001 C CNN "notes"
F 7 "C17414" H 7550 5500 50  0001 C CNN "JLC"
	1    7550 5500
	1    0    0    -1  
$EndComp
Wire Wire Line
	2950 2550 3850 2550
$Comp
L canbox-rescue:L_Core_Iron_Coupled_Small-Device L3
U 1 1 5C1EB7AE
P 9975 7000
F 0 "L3" H 9975 7231 50  0000 C CNN
F 1 "AE2002" H 9975 7140 50  0000 C CNN
F 2 "cypress:L_CMC_1812" H 9975 7000 50  0001 C CNN
F 3 "~" H 9975 7000 50  0001 C CNN
F 4 "1840-1044-1-ND" H 375 3200 50  0001 C CNN "OP"
F 5 "AE2002" H 375 3200 50  0001 C CNN "Arrow"
F 6 "1840-1044-1-ND" H 375 3200 50  0001 C CNN "DigiKez"
	1    9975 7000
	-1   0    0    -1  
$EndComp
Wire Wire Line
	9425 6950 9875 6950
Wire Wire Line
	10075 6950 10725 6950
Wire Wire Line
	10075 7050 10725 7050
$Comp
L canbox-rescue:C-Device C32
U 1 1 5C1F3D83
P 10875 6950
F 0 "C32" V 10623 6950 50  0000 C CNN
F 1 "100n" V 10714 6950 50  0000 C CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 10913 6800 50  0001 C CNN
F 3 "~" H 10875 6950 50  0001 C CNN
F 4 "CC0805KRX7R9BB104" H 375 3200 50  0001 C CNN "OP"
F 5 "ali" H 375 3200 50  0001 C CNN "notes"
F 6 " C49678 " H 10875 6950 50  0001 C CNN "JLC"
	1    10875 6950
	0    1    1    0   
$EndComp
$Comp
L canbox-rescue:C-Device C33
U 1 1 5C1F4773
P 10875 7350
F 0 "C33" V 10623 7350 50  0000 C CNN
F 1 "100n" V 10714 7350 50  0000 C CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 10913 7200 50  0001 C CNN
F 3 "~" H 10875 7350 50  0001 C CNN
F 4 "CC0805KRX7R9BB104" H 375 3200 50  0001 C CNN "OP"
F 5 "ali" H 375 3200 50  0001 C CNN "notes"
F 6 " C49678 " H 10875 7350 50  0001 C CNN "JLC"
	1    10875 7350
	0    -1   1    0   
$EndComp
Wire Wire Line
	10725 7050 10725 7350
Wire Wire Line
	11025 7350 11175 7350
Wire Wire Line
	11175 7350 11175 7050
Wire Wire Line
	11175 7050 11325 7050
Wire Wire Line
	11025 6950 11675 6950
$Comp
L canbox-rescue:R-Device R6
U 1 1 5C1FEEF5
P 11325 7500
F 0 "R6" H 11395 7546 50  0000 L CNN
F 1 "1k" H 11395 7455 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 11255 7500 50  0001 C CNN
F 3 "~" H 11325 7500 50  0001 C CNN
F 4 "0805W8F1001T5E" H 375 3200 50  0001 C CNN "OP"
F 5 "ok" H 375 3200 50  0001 C CNN "Mouser"
F 6 "ok" H 375 3200 50  0001 C CNN "notes"
F 7 "C17513" H 11325 7500 50  0001 C CNN "JLC"
	1    11325 7500
	1    0    0    -1  
$EndComp
$Comp
L canbox-rescue:R-Device R7
U 1 1 5C20047C
P 11675 7500
F 0 "R7" H 11745 7546 50  0000 L CNN
F 1 "1k" H 11745 7455 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 11605 7500 50  0001 C CNN
F 3 "~" H 11675 7500 50  0001 C CNN
F 4 "0805W8F1001T5E" H 375 3200 50  0001 C CNN "OP"
F 5 "ok" H 375 3200 50  0001 C CNN "Mouser"
F 6 "ok" H 375 3200 50  0001 C CNN "notes"
F 7 "C17513" H 11675 7500 50  0001 C CNN "JLC"
	1    11675 7500
	1    0    0    -1  
$EndComp
$Comp
L canbox-rescue:R-Device R8
U 1 1 5C2061D8
P 11675 7900
F 0 "R8" H 11745 7946 50  0000 L CNN
F 1 "124k" H 11745 7855 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 11605 7900 50  0001 C CNN
F 3 "~" H 11675 7900 50  0001 C CNN
F 4 "0805W8F1003T5E" H 375 3200 50  0001 C CNN "OP"
F 5 "stock" H 375 3200 50  0001 C CNN "Arrow"
F 6 "stok" H 375 3200 50  0001 C CNN "notes"
F 7 "C17407" H 11675 7900 50  0001 C CNN "JLC"
	1    11675 7900
	1    0    0    -1  
$EndComp
$Comp
L canbox-rescue:C-Device C34
U 1 1 5C206956
P 11325 7900
F 0 "C34" H 11210 7854 50  0000 R CNN
F 1 "4n7" H 11210 7945 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 11363 7750 50  0001 C CNN
F 3 "~" H 11325 7900 50  0001 C CNN
F 4 "885012207090" H 375 3200 50  0001 C CNN "OP"
F 5 "C1744 " H 11325 7900 50  0001 C CNN "JLC"
	1    11325 7900
	-1   0    0    1   
$EndComp
Wire Wire Line
	11325 8050 11325 8200
Wire Wire Line
	11675 8200 11675 8050
Wire Wire Line
	11325 7750 11325 7650
Connection ~ 11325 7750
Wire Wire Line
	11675 7650 11675 7750
Wire Wire Line
	11325 7750 11675 7750
Connection ~ 11675 7750
Wire Wire Line
	11675 7350 11675 6950
Connection ~ 11675 6950
Wire Wire Line
	11325 7050 11325 7350
Connection ~ 11325 7050
Text Label 11375 6950 0    50   ~ 0
TRX_CON0_P
Text Label 11375 7050 0    50   ~ 0
TRX_CON0_N
Text Label 10275 6950 0    50   ~ 0
TRX_0_P
Text Label 10275 7050 0    50   ~ 0
TRX_0_N
Text Label 9475 6950 0    50   ~ 0
TRX_0_T_P
Text Label 9475 7050 0    50   ~ 0
TRX_0_T_N
$Comp
L canbox-rescue:L-Device L1
U 1 1 5C215CCE
P 4600 3200
F 0 "L1" V 4790 3200 50  0000 C CNN
F 1 "BLM18AG601SN1" V 4699 3200 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 4600 3200 50  0001 C CNN
F 3 "~" H 4600 3200 50  0001 C CNN
F 4 "BLM18AG601SN1D" H 0   0   50  0001 C CNN "OP"
F 5 "BLM18AG601SN1D" H 0   0   50  0001 C CNN "Arrow"
F 6 "490-1014-1-ND" H 0   0   50  0001 C CNN "DigiKez"
F 7 "C19330" H 4600 3200 50  0001 C CNN "JLC"
	1    4600 3200
	0    -1   -1   0   
$EndComp
$Comp
L canbox-rescue:CP-Device C22
U 1 1 5C216E60
P 4850 3350
F 0 "C22" H 4968 3396 50  0000 L CNN
F 1 "10µF" H 4968 3305 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4888 3200 50  0001 C CNN
F 3 "~" H 4850 3350 50  0001 C CNN
F 4 "C0805C224Z3VACTU" H 0   0   50  0001 C CNN "OP"
F 5 "ali" H 0   0   50  0001 C CNN "notes"
F 6 "C45783 " H 4850 3350 50  0001 C CNN "JLC"
	1    4850 3350
	1    0    0    -1  
$EndComp
$Comp
L canbox-rescue:C-Device C24
U 1 1 5C217CB7
P 5200 3350
F 0 "C24" H 5315 3396 50  0000 L CNN
F 1 "100n" H 5315 3305 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5238 3200 50  0001 C CNN
F 3 "~" H 5200 3350 50  0001 C CNN
F 4 "CC0805KRX7R9BB104" H 0   0   50  0001 C CNN "OP"
F 5 "ali" H 0   0   50  0001 C CNN "notes"
F 6 " C49678 " H 5200 3350 50  0001 C CNN "JLC"
	1    5200 3350
	1    0    0    -1  
$EndComp
$Comp
L canbox-rescue:C-Device C27
U 1 1 5C218821
P 5600 3350
F 0 "C27" H 5715 3396 50  0000 L CNN
F 1 "10n" H 5715 3305 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5638 3200 50  0001 C CNN
F 3 "~" H 5600 3350 50  0001 C CNN
F 4 "CL21B103KBANNNC" H 0   0   50  0001 C CNN "OP"
F 5 "ali" H 0   0   50  0001 C CNN "notes"
F 6 "C1710" H 5600 3350 50  0001 C CNN "JLC"
	1    5600 3350
	1    0    0    -1  
$EndComp
Wire Wire Line
	4750 3200 4850 3200
Connection ~ 4850 3200
Wire Wire Line
	4850 3200 5200 3200
Connection ~ 5200 3200
Wire Wire Line
	5200 3200 5600 3200
Connection ~ 5600 3200
Wire Wire Line
	4850 3500 4850 3750
Wire Wire Line
	4850 3750 5200 3750
Wire Wire Line
	5600 3750 5600 3500
Wire Wire Line
	5200 3500 5200 3750
Connection ~ 5200 3750
Wire Wire Line
	5200 3750 5600 3750
$Comp
L canbox-rescue:GND-power #PWR018
U 1 1 5C243792
P 5200 3750
F 0 "#PWR018" H 5200 3500 50  0001 C CNN
F 1 "GND" H 5205 3577 50  0000 C CNN
F 2 "" H 5200 3750 50  0001 C CNN
F 3 "" H 5200 3750 50  0001 C CNN
	1    5200 3750
	1    0    0    -1  
$EndComp
$Comp
L canbox-rescue:C-Device C25
U 1 1 5C2487FC
P 5200 4300
F 0 "C25" H 5315 4346 50  0000 L CNN
F 1 "100n" H 5315 4255 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5238 4150 50  0001 C CNN
F 3 "~" H 5200 4300 50  0001 C CNN
F 4 "CC0805KRX7R9BB104" H -50 1600 50  0001 C CNN "OP"
F 5 "ali" H -50 1600 50  0001 C CNN "notes"
F 6 " C49678 " H 5200 4300 50  0001 C CNN "JLC"
	1    5200 4300
	1    0    0    -1  
$EndComp
Wire Wire Line
	4450 3200 3850 3200
$Comp
L canbox-rescue:L-Device L2
U 1 1 5C2CB497
P 4475 4150
F 0 "L2" V 4665 4150 50  0000 C CNN
F 1 "BLM18AG601SN1" V 4574 4150 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 4475 4150 50  0001 C CNN
F 3 "~" H 4475 4150 50  0001 C CNN
F 4 "BLM18AG601SN1D" H -1125 1300 50  0001 C CNN "OP"
F 5 "BLM18AG601SN1D" H -1125 1300 50  0001 C CNN "Arrow"
F 6 "490-1014-1-ND" H -1125 1300 50  0001 C CNN "DigiKez"
F 7 "C19330" H 4475 4150 50  0001 C CNN "JLC"
	1    4475 4150
	0    -1   -1   0   
$EndComp
$Comp
L canbox-rescue:GND-power #PWR019
U 1 1 5C2DFAC9
P 5200 4725
F 0 "#PWR019" H 5200 4475 50  0001 C CNN
F 1 "GND" H 5205 4552 50  0000 C CNN
F 2 "" H 5200 4725 50  0001 C CNN
F 3 "" H 5200 4725 50  0001 C CNN
	1    5200 4725
	1    0    0    -1  
$EndComp
Wire Wire Line
	9300 7050 9875 7050
Wire Wire Line
	9425 6950 9425 6900
Wire Wire Line
	9425 6900 9300 6900
Wire Wire Line
	1400 2550 2950 2550
Wire Wire Line
	7550 5350 7550 5300
Wire Wire Line
	3850 5300 3850 4150
Connection ~ 3850 3200
Text Notes 1150 5650 0    50   ~ 0
10k Pull down on reset, to keep the Ethernet in reset until the MCU is booted
Text Notes 9450 3400 0    50   ~ 0
Note the C  andR  have to be chosen according to the application note for EMI 
$Comp
L cypress:DP83TC811R-Q1 U2
U 1 1 5D901AA5
P 8550 7100
F 0 "U2" H 8577 6185 50  0000 C CNN
F 1 "DP83TC811R-Q1" H 8577 6094 50  0000 C CNN
F 2 "cypress:QFN-36_EP_6x6_Pitch0.5mm" H 8550 7100 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/dp83tc811r-q1.pdf" H 9436 8122 50  0001 C CNN
	1    8550 7100
	1    0    0    -1  
$EndComp
Wire Wire Line
	7850 6050 5850 6050
Wire Wire Line
	5850 6150 7850 6150
Wire Wire Line
	5850 7650 6950 7650
$Comp
L canbox-rescue:C-Device C20
U 1 1 5D95A1E6
P 5650 4300
F 0 "C20" H 5765 4346 50  0000 L CNN
F 1 "10n" H 5765 4255 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5688 4150 50  0001 C CNN
F 3 "~" H 5650 4300 50  0001 C CNN
F 4 "CL21B103KBANNNC" H 400 1600 50  0001 C CNN "OP"
F 5 "ali" H 400 1600 50  0001 C CNN "notes"
F 6 "C1710" H 5650 4300 50  0001 C CNN "JLC"
	1    5650 4300
	1    0    0    -1  
$EndComp
$Comp
L canbox-rescue:CP-Device C19
U 1 1 5D965B1B
P 4800 4300
F 0 "C19" H 4918 4346 50  0000 L CNN
F 1 "10µF" H 4918 4255 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4838 4150 50  0001 C CNN
F 3 "~" H 4800 4300 50  0001 C CNN
F 4 "C0805C224Z3VACTU" H -50 950 50  0001 C CNN "OP"
F 5 "ali" H -50 950 50  0001 C CNN "notes"
F 6 "C45783 " H 4800 4300 50  0001 C CNN "JLC"
	1    4800 4300
	1    0    0    -1  
$EndComp
Wire Wire Line
	5650 4150 5200 4150
Connection ~ 4800 4150
Wire Wire Line
	4800 4150 4625 4150
Connection ~ 5200 4150
Wire Wire Line
	5200 4150 4800 4150
Wire Wire Line
	4325 4150 3850 4150
Connection ~ 3850 4150
Wire Wire Line
	3850 4150 3850 3200
Wire Wire Line
	5650 4150 6025 4150
Wire Wire Line
	8400 4150 8400 5600
Connection ~ 5650 4150
Wire Wire Line
	8700 5600 8700 3200
Wire Wire Line
	5600 3200 6025 3200
Wire Wire Line
	4800 4450 4800 4725
Wire Wire Line
	4800 4725 5200 4725
Wire Wire Line
	5200 4450 5200 4725
Connection ~ 5200 4725
Wire Wire Line
	5650 4450 5650 4725
Wire Wire Line
	5650 4725 5200 4725
$Comp
L canbox-rescue:C-Device C21
U 1 1 5D98B067
P 6025 3350
F 0 "C21" H 6140 3396 50  0000 L CNN
F 1 "1µF" H 6140 3305 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 6063 3200 50  0001 C CNN
F 3 "~" H 6025 3350 50  0001 C CNN
F 4 "C0805C103K1RACTU" H 425 0   50  0001 C CNN "OP"
F 5 "ali" H 425 0   50  0001 C CNN "notes"
F 6 "C13967 " H 6025 3350 50  0001 C CNN "JLC"
	1    6025 3350
	1    0    0    -1  
$EndComp
Connection ~ 6025 3200
Wire Wire Line
	6025 3200 6300 3200
$Comp
L canbox-rescue:C-Device C23
U 1 1 5D992045
P 6025 4300
F 0 "C23" H 6140 4346 50  0000 L CNN
F 1 "1µF" H 6140 4255 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 6063 4150 50  0001 C CNN
F 3 "~" H 6025 4300 50  0001 C CNN
F 4 "C0805C103K1RACTU" H 425 950 50  0001 C CNN "OP"
F 5 "ali" H 425 950 50  0001 C CNN "notes"
F 6 "C13967 " H 6025 4300 50  0001 C CNN "JLC"
	1    6025 4300
	1    0    0    -1  
$EndComp
Connection ~ 6025 4150
Wire Wire Line
	6025 4150 7000 4150
Wire Wire Line
	5650 4725 6025 4725
Wire Wire Line
	6025 4725 6025 4450
Connection ~ 5650 4725
Wire Wire Line
	6025 3500 6025 3750
Wire Wire Line
	6025 3750 5600 3750
Connection ~ 5600 3750
Wire Wire Line
	7550 5650 7550 7550
Connection ~ 7550 7550
Wire Wire Line
	7550 7550 7850 7550
$Comp
L canbox-rescue:Jumper_NC_Small-Device JP3
U 1 1 5D07E798
P 10300 5525
AR Path="/5BDA19BB/5D07E798" Ref="JP3"  Part="1" 
AR Path="/5BD9E863/5D07E798" Ref="JP3"  Part="1" 
AR Path="/5BDA0002/5D07E798" Ref="JP2"  Part="1" 
F 0 "JP2" V 10346 5478 50  0000 R CNN
F 1 "SLAVE" V 10255 5478 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 10300 5525 50  0001 C CNN
F 3 "" H 10300 5525 50  0001 C CNN
	1    10300 5525
	-1   0    0    1   
$EndComp
$Comp
L canbox-rescue:LED-Device D2
U 1 1 5BF70923
P 9825 5850
F 0 "D2" H 9818 6066 50  0000 C CNN
F 1 "LED" H 9818 5975 50  0000 C CNN
F 2 "LED_SMD:LED_1210_3225Metric" H 9825 5850 50  0001 C CNN
F 3 "~" H 9825 5850 50  0001 C CNN
F 4 "151033RS03000" H 3175 1900 50  0001 C CNN "OP"
F 5 "C2297" H 9825 5850 50  0001 C CNN "JLC"
	1    9825 5850
	1    0    0    -1  
$EndComp
$Comp
L canbox-rescue:R-Device R19
U 1 1 5DA2AD5C
P 10275 5850
F 0 "R19" V 10482 5850 50  0000 C CNN
F 1 "100" V 10391 5850 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 10205 5850 50  0001 C CNN
F 3 "~" H 10275 5850 50  0001 C CNN
F 4 "ok" H 4025 1900 50  0001 C CNN "Mouser"
F 5 "ok" H 4025 1900 50  0001 C CNN "notes"
F 6 "C17408" H 10275 5850 50  0001 C CNN "JLC"
F 7 "0805W8F1000T5E" H 10275 5850 50  0001 C CNN "OP"
	1    10275 5850
	0    -1   -1   0   
$EndComp
Connection ~ 8400 4150
Wire Wire Line
	8400 4150 8425 4150
Wire Wire Line
	9300 5850 9450 5850
Wire Wire Line
	9975 5850 10125 5850
Wire Wire Line
	10425 5850 10650 5850
Wire Wire Line
	10650 5850 10650 5525
Wire Wire Line
	10650 5525 10950 5525
$Comp
L canbox-rescue:R-Device R14
U 1 1 5DA170D6
P 9825 5525
F 0 "R14" V 10032 5525 50  0000 C CNN
F 1 "2.49k" V 9941 5525 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 9755 5525 50  0001 C CNN
F 3 "~" H 9825 5525 50  0001 C CNN
F 4 "ok" H 3575 1575 50  0001 C CNN "Mouser"
F 5 "ok" H 3575 1575 50  0001 C CNN "notes"
F 6 "C21237" H 9825 5525 50  0001 C CNN "JLC"
F 7 "0805W8F2491T5E" H 9825 5525 50  0001 C CNN "OP"
	1    9825 5525
	0    -1   -1   0   
$EndComp
Wire Wire Line
	10200 5525 9975 5525
Wire Wire Line
	9675 5525 9450 5525
Wire Wire Line
	9450 5525 9450 5850
Connection ~ 9450 5850
Wire Wire Line
	9450 5850 9675 5850
Wire Wire Line
	10400 5525 10650 5525
Connection ~ 10650 5525
Wire Wire Line
	10950 2750 10950 5525
$Comp
L canbox-rescue:LED-Device D4
U 1 1 5DA1F79D
P 9825 6175
F 0 "D4" H 9818 6391 50  0000 C CNN
F 1 "LED" H 9818 6300 50  0000 C CNN
F 2 "LED_SMD:LED_1210_3225Metric" H 9825 6175 50  0001 C CNN
F 3 "~" H 9825 6175 50  0001 C CNN
F 4 "151033RS03000" H 3175 2225 50  0001 C CNN "OP"
F 5 "C2297" H 9825 6175 50  0001 C CNN "JLC"
	1    9825 6175
	1    0    0    -1  
$EndComp
$Comp
L canbox-rescue:R-Device R18
U 1 1 5DA226D7
P 10275 6175
F 0 "R18" V 10482 6175 50  0000 C CNN
F 1 "100" V 10391 6175 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 10205 6175 50  0001 C CNN
F 3 "~" H 10275 6175 50  0001 C CNN
F 4 "ok" H 4025 2225 50  0001 C CNN "Mouser"
F 5 "ok" H 4025 2225 50  0001 C CNN "notes"
F 6 "C17408" H 10275 6175 50  0001 C CNN "JLC"
F 7 "0805W8F1000T5E" H 10275 6175 50  0001 C CNN "OP"
	1    10275 6175
	0    -1   -1   0   
$EndComp
Wire Wire Line
	9300 5950 9450 5950
Wire Wire Line
	9450 5950 9450 6175
Wire Wire Line
	9450 6175 9675 6175
Wire Wire Line
	9975 6175 10125 6175
Wire Wire Line
	10425 6175 10650 6175
Wire Wire Line
	10650 6175 10650 5850
Connection ~ 10650 5850
Wire Wire Line
	11325 8200 9975 8200
Wire Wire Line
	8550 8200 8550 7950
Connection ~ 11325 8200
Wire Wire Line
	3850 2750 3850 3200
Wire Wire Line
	3850 2550 3850 2750
Connection ~ 3850 2750
Wire Wire Line
	3850 2750 10950 2750
Text Label 7300 6600 0    50   ~ 0
RGMII_CLK
Text Label 7325 6700 0    50   ~ 0
RGMII_DO
Text Label 7325 6800 0    50   ~ 0
RGMII_D1
Text Label 7325 6900 0    50   ~ 0
RGMII_DV
Text Label 7325 7200 0    50   ~ 0
RGMII_TX_D1
Text Label 7325 7300 0    50   ~ 0
RGMII_TX_EN
Text Label 7325 7550 0    50   ~ 0
MDIO
Text Label 7325 7650 0    50   ~ 0
MDC
$Comp
L Device:Crystal_GND24_Small Y2
U 1 1 5EB83F1E
P 9850 7550
F 0 "Y2" V 9804 7694 50  0000 L CNN
F 1 "25 MHz" V 9895 7694 50  0000 L CNN
F 2 "Crystal:Crystal_SMD_3225-4Pin_3.2x2.5mm_HandSoldering" H 9850 7550 50  0001 C CNN
F 3 "~" H 9850 7550 50  0001 C CNN
F 4 "C9006" H 9850 7550 50  0001 C CNN "JLC"
F 5 "X322525MOB4SI" H 9850 7550 50  0001 C CNN "OP"
	1    9850 7550
	0    1    1    0   
$EndComp
Wire Wire Line
	9850 7650 9850 7700
Connection ~ 9850 7700
Wire Wire Line
	9850 7450 9850 7400
Connection ~ 9850 7400
Wire Wire Line
	9750 7550 9625 7550
Wire Wire Line
	9625 7550 9625 8200
Connection ~ 9625 8200
Wire Wire Line
	9625 8200 9000 8200
Wire Wire Line
	9950 7550 9975 7550
Wire Wire Line
	9975 7550 9975 8200
Connection ~ 9975 8200
Wire Wire Line
	9975 8200 9625 8200
$Comp
L Connector:TestPoint TP5
U 1 1 5F355167
P 9000 8200
F 0 "TP5" H 9058 8318 50  0000 L CNN
F 1 "GND" H 9058 8227 50  0000 L CNN
F 2 "TestPoint:TestPoint_THTPad_1.5x1.5mm_Drill0.7mm" H 9200 8200 50  0001 C CNN
F 3 "~" H 9200 8200 50  0001 C CNN
	1    9000 8200
	1    0    0    -1  
$EndComp
Connection ~ 9000 8200
Wire Wire Line
	9000 8200 8550 8200
$Comp
L Connector:TestPoint TP2
U 1 1 5F3567C5
P 6950 7650
F 0 "TP2" H 7008 7768 50  0000 L CNN
F 1 "MDC" H 7008 7677 50  0000 L CNN
F 2 "TestPoint:TestPoint_THTPad_1.5x1.5mm_Drill0.7mm" H 7150 7650 50  0001 C CNN
F 3 "~" H 7150 7650 50  0001 C CNN
	1    6950 7650
	1    0    0    -1  
$EndComp
Connection ~ 6950 7650
Wire Wire Line
	6950 7650 7850 7650
Wire Wire Line
	8550 8200 7950 8200
Connection ~ 8550 8200
Text Notes 0    0    0    50   ~ 0
scyt129e.pdf
Wire Wire Line
	7950 9800 7950 8200
Wire Wire Line
	2950 9800 2950 3000
Connection ~ 2950 3000
Text Label 9350 8200 0    50   ~ 0
GND
$Comp
L power:GND #PWR0108
U 1 1 5E1BFE69
P 6600 9800
F 0 "#PWR0108" H 6600 9550 50  0001 C CNN
F 1 "GND" H 6605 9627 50  0000 C CNN
F 2 "" H 6600 9800 50  0001 C CNN
F 3 "" H 6600 9800 50  0001 C CNN
	1    6600 9800
	1    0    0    -1  
$EndComp
Connection ~ 6600 9800
Wire Wire Line
	6600 9800 7950 9800
Text Label 6300 4150 0    50   ~ 0
ETH_3V3
Wire Wire Line
	5850 6350 6850 6350
Wire Wire Line
	6850 6350 6850 8450
$Comp
L canbox-rescue:R-Device R26
U 1 1 5E45B6BA
P 9450 7950
F 0 "R26" H 9520 7996 50  0000 L CNN
F 1 "NM" H 9520 7905 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 9380 7950 50  0001 C CNN
F 3 "~" H 9450 7950 50  0001 C CNN
F 4 "0805W8F1003T5E" H -1850 3250 50  0001 C CNN "OP"
F 5 "stock" H -1850 3250 50  0001 C CNN "Arrow"
F 6 "stok" H -1850 3250 50  0001 C CNN "notes"
F 7 "C17407" H 9450 7950 50  0001 C CNN "JLC"
	1    9450 7950
	1    0    0    -1  
$EndComp
Connection ~ 9450 7700
Wire Wire Line
	9450 7700 9850 7700
Wire Wire Line
	5850 7550 7200 7550
Wire Wire Line
	7850 6250 5850 6250
Wire Wire Line
	2950 9800 6600 9800
$Comp
L Connector:TestPoint TP4
U 1 1 5DF0EC9C
P 7200 7550
F 0 "TP4" H 7258 7668 50  0000 L CNN
F 1 "MDIO" H 7258 7577 50  0000 L CNN
F 2 "TestPoint:TestPoint_THTPad_1.5x1.5mm_Drill0.7mm" H 7400 7550 50  0001 C CNN
F 3 "~" H 7400 7550 50  0001 C CNN
	1    7200 7550
	1    0    0    -1  
$EndComp
Connection ~ 7200 7550
Wire Wire Line
	7200 7550 7550 7550
Wire Wire Line
	3850 5300 7100 5300
Wire Wire Line
	9450 8050 9450 8100
$Comp
L Connector:TestPoint TP7
U 1 1 5E82C217
P 7050 3200
F 0 "TP7" H 7108 3318 50  0000 L CNN
F 1 "ETH_A" H 7108 3227 50  0000 L CNN
F 2 "TestPoint:TestPoint_THTPad_1.5x1.5mm_Drill0.7mm" H 7250 3200 50  0001 C CNN
F 3 "~" H 7250 3200 50  0001 C CNN
	1    7050 3200
	1    0    0    -1  
$EndComp
Connection ~ 7050 3200
Wire Wire Line
	7050 3200 8700 3200
$Comp
L Connector:TestPoint TP6
U 1 1 5E82D600
P 7000 4150
F 0 "TP6" H 7058 4268 50  0000 L CNN
F 1 "ETH_IO" H 7058 4177 50  0000 L CNN
F 2 "TestPoint:TestPoint_THTPad_1.5x1.5mm_Drill0.7mm" H 7200 4150 50  0001 C CNN
F 3 "~" H 7200 4150 50  0001 C CNN
	1    7000 4150
	1    0    0    -1  
$EndComp
Connection ~ 7000 4150
Wire Wire Line
	7000 4150 7650 4150
Wire Wire Line
	7850 5850 7850 4150
Connection ~ 7850 4150
Wire Wire Line
	7850 4150 8400 4150
Wire Wire Line
	7850 5950 7650 5950
Wire Wire Line
	7650 5950 7650 4150
Connection ~ 7650 4150
Wire Wire Line
	7650 4150 7850 4150
Text HLabel 3900 1400 0    50   Input ~ 0
5V
$Comp
L cypress:TL1963A U3
U 1 1 5EBBF6A6
P 4450 1250
F 0 "U3" H 4825 1365 50  0000 C CNN
F 1 "TL1963A" H 4825 1274 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:TO-263-5_TabPin3" H 4450 1250 50  0001 C CNN
F 3 "" H 4450 1250 50  0001 C CNN
	1    4450 1250
	1    0    0    -1  
$EndComp
Wire Wire Line
	3900 1400 4100 1400
Wire Wire Line
	4350 1550 4100 1550
Wire Wire Line
	4100 1550 4100 1400
Connection ~ 4100 1400
Wire Wire Line
	4100 1400 4350 1400
Wire Wire Line
	5500 1550 5500 1400
Wire Wire Line
	5500 1400 5300 1400
Wire Wire Line
	5300 1550 5500 1550
Wire Wire Line
	4800 1950 4800 2150
Wire Wire Line
	6300 3200 6300 1400
Wire Wire Line
	6300 1400 5500 1400
Connection ~ 6300 3200
Wire Wire Line
	6300 3200 7050 3200
Connection ~ 5500 1400
$Comp
L canbox-rescue:GND-power #PWR0109
U 1 1 5EBC52DF
P 4800 2150
F 0 "#PWR0109" H 4800 1900 50  0001 C CNN
F 1 "GND" H 4805 1977 50  0000 C CNN
F 2 "" H 4800 2150 50  0001 C CNN
F 3 "" H 4800 2150 50  0001 C CNN
	1    4800 2150
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Pack04 RN1
U 1 1 5E119631
P 6550 6800
F 0 "RN1" V 6133 6800 50  0000 C CNN
F 1 "50" V 6224 6800 50  0000 C CNN
F 2 "Resistor_SMD:R_Array_Concave_4x0603" V 6825 6800 50  0001 C CNN
F 3 "~" H 6550 6800 50  0001 C CNN
	1    6550 6800
	0    -1   1    0   
$EndComp
$Comp
L Device:R_Pack04 RN2
U 1 1 5E1291CA
P 6550 7300
F 0 "RN2" V 6133 7300 50  0000 C CNN
F 1 "50" V 6224 7300 50  0000 C CNN
F 2 "Resistor_SMD:R_Array_Concave_4x0603" V 6825 7300 50  0001 C CNN
F 3 "~" H 6550 7300 50  0001 C CNN
	1    6550 7300
	0    1    1    0   
$EndComp
$Comp
L lpc_LPC54616J512:LPC54616J512 U1
U 9 1 5C1702B1
P 4050 5550
F 0 "U1" H 4958 5715 50  0000 C CNN
F 1 "LPC54616J512" H 4958 5624 50  0000 C CNN
F 2 "Package_QFP:LQFP-100_14x14mm_P0.5mm" H 4100 5400 50  0001 C CNN
F 3 "" H 4100 5400 50  0001 C CNN
F 4 "LPC54616J512BD100E" H 2200 -150 50  0001 C CNN "OP"
F 5 "nm" H -850 0   50  0001 C CNN "Arrow"
	9    4050 5550
	1    0    0    -1  
$EndComp
Text Label 7325 7100 0    50   ~ 0
RGMII_TX_D0
Wire Wire Line
	11325 8200 11675 8200
Wire Wire Line
	11325 7050 11825 7050
Wire Wire Line
	11675 6950 11825 6950
$Comp
L canbox-rescue:Screw_Terminal_01x02-Connector J3
U 1 1 5C2025A7
P 12025 6950
AR Path="/5C2025A7" Ref="J3"  Part="1" 
AR Path="/5BDA0002/5C2025A7" Ref="J3"  Part="1" 
F 0 "J3" H 12105 6942 50  0000 L CNN
F 1 "100BaseT1" H 12105 6851 50  0000 L CNN
F 2 "TerminalBlock_Phoenix:TerminalBlock_Phoenix_MPT-0,5-2-2.54_1x02_P2.54mm_Horizontal" H 12025 6950 50  0001 C CNN
F 3 "~" H 12025 6950 50  0001 C CNN
F 4 "282834-2" H 375 3200 50  0001 C CNN "OP"
F 5 "282834-2" H 375 3100 50  0001 C CNN "Arrow"
F 6 "282834-2" H 375 3100 50  0001 C CNN "DigiKez"
	1    12025 6950
	1    0    0    -1  
$EndComp
Wire Wire Line
	7850 6600 6750 6600
Wire Wire Line
	6750 6700 7350 6700
Wire Wire Line
	7850 6800 7100 6800
Wire Wire Line
	7850 6900 6750 6900
Wire Wire Line
	5850 6900 6350 6900
Wire Wire Line
	6350 6800 5850 6800
Wire Wire Line
	5850 6700 6350 6700
Wire Wire Line
	6750 7200 7850 7200
Wire Wire Line
	5850 7200 6350 7200
Wire Wire Line
	6150 7100 5850 7100
Wire Wire Line
	6350 7300 6150 7300
Wire Wire Line
	6150 7300 6150 7100
Wire Wire Line
	5850 7300 6100 7300
Wire Wire Line
	6100 7300 6100 7400
Wire Wire Line
	6100 7400 6350 7400
Wire Wire Line
	7850 7100 6950 7100
Wire Wire Line
	6950 7100 6950 7300
Wire Wire Line
	6950 7300 6750 7300
Wire Wire Line
	6750 7400 7050 7400
Wire Wire Line
	7050 7400 7050 7300
Wire Wire Line
	7050 7300 7850 7300
Wire Wire Line
	6350 6600 5850 6600
NoConn ~ 5850 5950
NoConn ~ 5850 5850
NoConn ~ 6750 7100
NoConn ~ 6350 7100
$Comp
L canbox-rescue:R-Device R5
U 1 1 5E8EB6CE
P 7350 5500
F 0 "R5" H 7420 5546 50  0000 L CNN
F 1 "2.49k" H 7420 5455 50  0000 L CNN
F 2 "Resistor_SMD:R_0402_1005Metric" V 7280 5500 50  0001 C CNN
F 3 "~" H 7350 5500 50  0001 C CNN
F 4 "0805W8F1002T5E" H 3500 -1950 50  0001 C CNN "OP"
F 5 "ok" H -200 0   50  0001 C CNN "Mouser"
F 6 "ok" H -200 0   50  0001 C CNN "notes"
F 7 "C17414" H 7350 5500 50  0001 C CNN "JLC"
	1    7350 5500
	1    0    0    -1  
$EndComp
$Comp
L canbox-rescue:R-Device R2
U 1 1 5E8F9F88
P 7100 5500
F 0 "R2" H 7170 5546 50  0000 L CNN
F 1 "2.49k" H 7170 5455 50  0000 L CNN
F 2 "Resistor_SMD:R_0402_1005Metric" V 7030 5500 50  0001 C CNN
F 3 "~" H 7100 5500 50  0001 C CNN
F 4 "0805W8F1002T5E" H 3250 -1950 50  0001 C CNN "OP"
F 5 "ok" H -450 0   50  0001 C CNN "Mouser"
F 6 "ok" H -450 0   50  0001 C CNN "notes"
F 7 "C17414" H 7100 5500 50  0001 C CNN "JLC"
	1    7100 5500
	1    0    0    -1  
$EndComp
Wire Wire Line
	7100 5350 7100 5300
Connection ~ 7100 5300
Wire Wire Line
	7100 5300 7350 5300
Wire Wire Line
	7350 5300 7350 5350
Connection ~ 7350 5300
Wire Wire Line
	7350 5300 7550 5300
Wire Wire Line
	7350 5650 7350 6700
Connection ~ 7350 6700
Wire Wire Line
	7350 6700 7850 6700
Wire Wire Line
	7100 5650 7100 6800
Connection ~ 7100 6800
Wire Wire Line
	7100 6800 6750 6800
Connection ~ 9450 8100
Wire Wire Line
	9450 8100 9450 8450
Wire Wire Line
	9450 7700 9450 7800
$Comp
L canbox-rescue:R-Device R10
U 1 1 5EBB2F56
P 7350 8450
F 0 "R10" V 7143 8450 50  0000 C CNN
F 1 "NM" V 7234 8450 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 3400 15830 50  0001 C CNN
F 3 "~" H 3400 15900 50  0001 C CNN
F 4 "0805W8F1003T5E" H 8100 4600 50  0001 C CNN "OP"
F 5 "stock" H 8100 4600 50  0001 C CNN "Arrow"
F 6 "stok" H 8100 4600 50  0001 C CNN "notes"
F 7 "C17407" H 3400 15900 50  0001 C CNN "JLC"
	1    7350 8450
	0    1    1    0   
$EndComp
Wire Wire Line
	6850 8450 7200 8450
Wire Wire Line
	7500 8450 9450 8450
Text Notes 7150 8600 0    50   ~ 0
Near Sender
$EndSCHEMATC
