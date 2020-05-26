/* 
 * linker-script to control the placement of the .text and .data
 * sections
 */
ENTRY (_start)              /* entry point to our code can be found here */
SECTIONS
{
    . = 1M;                 /* location counter set to 0x1000000 - kernel start address*/

                    
                            /* .text section of all input files should be
                               merged with .text section of the output file */
    .text :                 
    { 
        *(.text) 
    }

                            /* .bss sections of input merge with .bss output
                                .data contains globals
                                .bss  contains variables (other?!) */
    .bss  :
    { 
        *(.bss) 
    }
}
