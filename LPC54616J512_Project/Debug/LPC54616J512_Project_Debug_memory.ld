/*
 * GENERATED FILE - DO NOT EDIT
 * (c) Code Red Technologies Ltd, 2008-2013
 * (c) NXP Semiconductors 2013-2018
 * Generated linker script file for LPC54616J512
 * Created from memory.ldt by FMCreateLinkMemory
 * Using Freemarker v2.3.23
 * MCUXpresso IDE v10.2.1 [Build 795] [2018-07-25] on Nov 5, 2018 10:11:18 PM
 */

MEMORY
{
  /* Define each memory region */
  PROGRAM_FLASH (rx) : ORIGIN = 0x0, LENGTH = 0x80000 /* 512K bytes (alias Flash) */  
  SRAM_0_1_2_3 (rwx) : ORIGIN = 0x20000000, LENGTH = 0x28000 /* 160K bytes (alias RAM) */  
  SRAMX (rwx) : ORIGIN = 0x4000000, LENGTH = 0x8000 /* 32K bytes (alias RAM2) */  
  USB_RAM (rwx) : ORIGIN = 0x40100000, LENGTH = 0x2000 /* 8K bytes (alias RAM3) */  
}

  /* Define a symbol for the top of each memory region */
  __base_PROGRAM_FLASH = 0x0  ; /* PROGRAM_FLASH */  
  __base_Flash = 0x0 ; /* Flash */  
  __top_PROGRAM_FLASH = 0x0 + 0x80000 ; /* 512K bytes */  
  __top_Flash = 0x0 + 0x80000 ; /* 512K bytes */  
  __base_SRAM_0_1_2_3 = 0x20000000  ; /* SRAM_0_1_2_3 */  
  __base_RAM = 0x20000000 ; /* RAM */  
  __top_SRAM_0_1_2_3 = 0x20000000 + 0x28000 ; /* 160K bytes */  
  __top_RAM = 0x20000000 + 0x28000 ; /* 160K bytes */  
  __base_SRAMX = 0x4000000  ; /* SRAMX */  
  __base_RAM2 = 0x4000000 ; /* RAM2 */  
  __top_SRAMX = 0x4000000 + 0x8000 ; /* 32K bytes */  
  __top_RAM2 = 0x4000000 + 0x8000 ; /* 32K bytes */  
  __base_USB_RAM = 0x40100000  ; /* USB_RAM */  
  __base_RAM3 = 0x40100000 ; /* RAM3 */  
  __top_USB_RAM = 0x40100000 + 0x2000 ; /* 8K bytes */  
  __top_RAM3 = 0x40100000 + 0x2000 ; /* 8K bytes */  
