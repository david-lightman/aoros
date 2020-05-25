bits 32
global _start                   ; declare ENTRY POINT for the linker
extern kernel_early             ; declare a few external routines
extern main

; code segment 
; grub multiboot-1 header
; https://www.gnu.org/software/grub/manual/multiboot/multiboot.html
;
; Offset Type Field Name
; ------ ---- ----------
;   0    u32  magic
;   4    u32  flags
;   8    u32  checksum
;
section .text
    align 4                     ; align to a 4-byte boundary (32-bit system)
    dd 0x1BADB002               ; grub magic
    dd 0x00                     ; flags
    dd - (0x1BADB002 + 0x00)    ; checksum; when added to magic+flags should equal zero

; ENTRY
_start:                         
  cli                           ; clear/disable interrupts
  mov esp, stack                ; allocate memory for the stack
  call kernel_early
  call main
  hlt

; data segment - buffer segment for variables  to be declared later in the program
;  buffer memory is zero filled
section .bss
  resb 8192                     ; reserve 8KB memory for our stack

; currently empty; allocate memory and map to stack pointer
stack:
