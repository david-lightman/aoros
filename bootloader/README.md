# bootloader
Generic bootloader

## Compile

  To compile, use `nasm` to create a bin file:

  `nasm -f bin -o bootloader.img bootloader.asm`

## Booting in VirtualBox

 * Create a generic instance

   * Name: test-bootloader
   * Type: Other
   * Version: Other/Unknown
   * Mem size: 4MB

   [x] Do not add a virtual hard disk

 * Settings >> Storage

   * Storage Devices
     * Create Floppy Controller _l82078_
     * Create Floppy Drive (bootloader.img)

