cd /media/sda1

echo "Flashing kernel"
export part_kernel=2
flash_eraseall /dev/mtd${part_kernel} && nandwrite -p /dev/mtd${part_kernel} -p zImage

echo "Flashing dtb"
export part_dtb=3
flash_eraseall /dev/mtd${part_dtb}  && nandwrite -p /dev/mtd${part_dtb} -p mid7c-g.dtb

echo "Flashing Logo"
export part_logo=4
flash_eraseall /dev/mtd${part_logo} && nandwrite -p /dev/mtd${part_logo} -p logo-1024-768.bmp

echo "Flashing rootfs"
export part_rootfs=5
flash_eraseall -j /dev/mtd${part_rootfs}
ubiattach /dev/ubi_ctrl -m ${part_rootfs}
ubimkvol /dev/ubi0 -N rootfs -m ${part_rootfs}

mkdir -p /run/media/mtd${part_rootfs}
mount -t ubifs ubi0:rootfs /run/media/mtd${part_rootfs}
tar vxf rootfs.tar.bz2 -C /run/media/mtd${part_rootfs}
tar vxf PlcLogic.tar.gz -C  /run/media/mtd${part_rootfs}/userapp/

sync && sync && sync
umount /run/media/mtd${part_rootfs}
reboot
