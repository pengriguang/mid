cd /run/media/sda1

echo "Flashing uboot"
export part_uboot=0
flash_erase /dev/mtd${part_uboot} 0 0 && kobs-ng init -x -v u-boot.imx  

reboot


