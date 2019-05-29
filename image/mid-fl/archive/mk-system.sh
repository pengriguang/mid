

fuser -km /mnt/mmcblk3p2/
sleep 3
umount /mnt/mmcblk3p2/
mkfs.ext4 /dev/mmcblk3p2

mount -t ext4 /dev/mmcblk3p2 /mnt/mmcblk3p2/

cp usr.tar.gz /mnt/mmcblk3p2/
cp autoStartRcs.sh /mnt/mmcblk3p2/
cp autoStartProfile.sh /mnt/mmcblk3p2/

cd /mnt/mmcblk3p2/
tar zxvf usr.tar.gz
rm -rf usr.tar.gz

mkdir -p /mnt/mmcblk3p2/userapp/codesysctl
cp /media/sda1/codesyscontrol /mnt/mmcblk3p2/userapp/codesysctl/
cp /media/sda1/3S.dat /mnt/mmcblk3p2/userapp/
cp /media/sda1/CODESYSControl.cfg /mnt/mmcblk3p2/userapp/codesysctl/

cp /media/sda1/rts_set_baud.zip /mnt/mmcblk3p2/userapp/codesysctl/
cd /mnt/mmcblk3p2/userapp/codesysctl/
unzip rts_set_baud.zip
chmod +x -R rts_set_baud
rm -rf rts_set_baud.zip

reboot


