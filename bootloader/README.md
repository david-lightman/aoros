# bootloader
Generic bootloader 

## Compile

  To compile, use `nasm` to create a bin file:

  `nasm -f bin -o bootloader.img bootloader.asm`

  As expected, the img file is 512-bytes, which corresponds to the 512-byte [MBR](https://en.wikipedia.org/wiki/Master_boot_record)
  
  ```
    [centos@tikhon bootloader]$ ls -l *img
    -rw-rw-r--. 1 centos centos 512 May 24 22:39 bootloader.img
  ```

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

