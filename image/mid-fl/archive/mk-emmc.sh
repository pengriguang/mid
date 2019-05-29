mkdir -p /media/mmcblk3p1/
mount /dev/mmcblk3p1 /media/mmcblk3p1/
cp /media/sda1/zImage-v3-1024-768 /media/mmcblk3p1/zImage
cp /media/sda1/logo-1280-800-1024-768.bmp /media/mmcblk3p1/logo.bmp
cp /media/sda1/ramdisk.gz /media/mmcblk3p1/
cp /media/sda1/imx6dl-s3-sabresd-lvds-1024-768.dtb /media/mmcblk3p1/imx6dl-s3-sabresd-lvds.dtb

cd
umount /media/mmcblk3p1/

reboot


