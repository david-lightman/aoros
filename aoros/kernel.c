static char* const VGA_MEMORY = (char*)0xb8000;

static const int VGA_WIDTH  = 80;
static const int VGA_HEIGHT = 25;

void 
kernel_early (void)
{
    // do some early work here
}

int 
main (void)
{
    const char* str = "OK - AOROS v0.01";
    unsigned int i = 0;     // placeholder for text string position
    unsigned int j = 0;     // placeholder for video buffer position

    while (str[i] != '\0') {
        VGA_MEMORY[j]      = str[i];
        VGA_MEMORY[j + 1]  = 0x0a;
        i++;
        j+=2;
    }

    return 0;
}
