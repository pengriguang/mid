����˵����

1. ��u-boot�����л�������
setenv boot_usb1 "usb reset; fatload usb 0 ${loadaddr} zImage; fatload usb 0  ${fdt_addr} mid7c-g.dtb && bootz ${loadaddr} - ${fdt_addr}"
setenv ramdisk_load_address 0x83800000 
setenv ramdisk_img ramdisk.gz
setenv bootargs_ramdisk 'console=ttymxc0,115200 initrd=0x83800000,64M root=/dev/ram0  rw earlyprintk boot_flag=ramdisk'
setenv boot_usb2 "setenv bootargs ${bootargs_ramdisk}; usb reset; fatload usb 0 ${loadaddr} zImage; fatload usb 0  ${fdt_addr} mid7c-g.dtb; fatload usb 0 ${ramdisk_load_address} ${ramdisk_img} && bootz ${loadaddr} - ${fdt_addr}"
saveenv
run boot_usb1

2. Linuxϵͳ��U��֮�󣬽���Ŀ¼
cd /run/media/sda1/

3. ִ�нű���sh mk-nand.sh

4. ϵͳ������ֹͣ��u-boot�����л�������
run boot_usb2

5.  ϵͳ�������֮�󣬽���Ŀ¼/media/sda1��ִ��mk-system.sh�ű�


