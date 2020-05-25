bits 16
start:
mov ax, 0x07c0  ;512B MBR loaded to 0x07c00
add ax, 0x20    ;offset for 0x200 (512 bytes)
mov ss, ax      ;move the bottom of the stack to 0x07e00 (0x7c00+0x200 bytes)
mov sp, 0x1000  ;stack pointer to 0x08e00 (stack grows down towards ss)

mov ax, 0x07c0  ;set the data segment
mov ds, ax      ;

mov si, msg     ;place ptr to our msg in source-index SI register
call print      ; goto print:
cli
hlt
data:
 msg db 'Hello bootloader!', 0  ; copy string to memory location in data-seg

print:
 mov ah, 0x0e   ; move the print-char BIOS procedure into AH
                ; fall thru to .printchar

.printchar:
 lodsb          ;load a byte from SI into AL and increment SI
 cmp al, 0      ; compare to zero
 je .done       ; jump if above is equal to zero
 int 0x10       ; 10H is BIOS video services; 0x0e is write char in TTY mode
 jmp .printchar ; do it again from .printchar

.done:
 ret

; MBR is 512 bytes
; write a zero-byte (db 0) 510 times from the start-of-segement-position ($$)
; to the current-position ($); since the MBR is 512-bytes, we need to leave
; two bytes for our signature
times 510 - ($ - $$) db 0
dw 0xaa55       ; master boot record signature
