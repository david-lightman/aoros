# aoros
Kernel files for άωρος 

#### Files

* start.asm - entry point for our kernel
    uses [GNU GRUB Multiboot-1](https://www.gnu.org/software/grub/manual/multiboot/multiboot.html) specification
    defines two _extern_ functions: `main` and `kernel_early` for setup work

    Entry point can be compiled in 32-bit _protected-mode_:

    `nasm -f elf32 start.asm -o start.o`

* kernel.c - the beginnings of our monolithic kernel

* linker.ld

