#include "stdint.h"
#include "stddef.h"
#include "stdarg.h"
#include "tty.h"
#include "../libc/include/string.h"

static const size_t VGA_WIDTH  = 80;
static const size_t VGA_HEIGHT = 25;

static uint16_t* const VGA_MEMORY = (uint16_t*) 0xb8000;

size_t terminal_row;
size_t terminal_column;
uint8_t terminal_color;
uint16_t* terminal_buffer;

static inline uint8_t make_color (enum vga_color fg, enum vga_color bg)
{
    return fg | bg << 4;
}


static inline uint16_t make_vgaentry (char c, uint8_t color)
{
    uint16_t c16 = c;
    uint16_t color16 = color;

    return c16 | color16 << 8;
}

void terminal_initialize (void)
{
    terminal_row = 0;
    terminal_column = 0;
    terminal_color = make_color (COLOR_LIGHT_GREY, COLOR_BLACK);
    terminal_buffer = VGA_MEMORY;

    size_t y;
    for (y = 0; y < VGA_HEIGHT; y++) {
        size_t x;
        for (x = 0; x < VGA_WIDTH; x++) {
            const size_t index = y * VGA_WIDTH + x;
            terminal_buffer[index] = make_vgaentry('    ', terminal_color);
        }
    }
}

void terminal_scroll () 
{
    int i;

    for (i = 0; i < VGA_HEIGHT; i++) {
        int m;
        for (m = 0; m < VGA_WIDTH; m++) {
            terminal_buffer[i * VGA_WIDTH + m] = terminal_buffer[(i+1) * VGA_WIDTH + m];
        }
        terminal_row--;
    }
    terminal_row = VGA_HEIGHT - 1;
}

void terminal_putentryat (char c, uint8_t color, size_t x, size_t y)
{
    const size_t index = y * VGA_WIDTH + x;
    terminal_buffer[index] = make_vgaentry (c, color);
}

// NOT FinISHED page 92

