U盘烧写系统说明：需要接调试串口，所有命令在调试串口中运行

U盘烧写系统步骤：
1. 在PC上插入U盘，将image目录下所有文件考入U盘中，然后将U盘插入显示屏，接下来运行如下命令
   用户需要确认U盘的挂载目录，假设U盘挂载到/media/sda1目录，如果挂载到其它目录，需要根据挂载的其它目录修改mk-emmc.sh文件
   
cd /media/sda1/
sh mk-emmc.sh

2.	系统重启时，按键盘任意键，使之停止在u-boot的命令提示符下，然后输入命令
setenv ramdisk_img ramdisk.gz
setenv loadramdisk "fatload mmc ${mmcdev}:${mmcpart} ${initrd_addr} ${ramdisk_img}"
setenv bootargs "console=ttymxc0,115200 initrd=0x12C00000,64M  root=/dev/ram0  rw quiet boot_flag=ramdisk"
setenv boot_cyber "run loadimage && run loadfdt && run loadramdisk && bootz ${loadaddr} - ${fdt_addr}"
setenv bootcmd "run boot_cyber"
setenv bootdelay 1
saveenv
reset


3. 重新格式化磁盘，重新建立第二分区目录和文件
cd /media/sda1/
sh mk-system.sh
在提示符下输入  y

3.1 如果显示 mount: mounting /dev/mmcblk3p2 on /mnt/mmcblk3p2/ failed: Device or resource busy 的提示
则按  ctrl + c 中断操作，然后，重新运行命令
sh mk-system.sh

4. 修复第一分区
fsck.fat /dev/mmcblk3p1  
按1，然后按y

5. ts_calibrate 校准触摸屏

6. 在codesys的前台界面中下载掉wuxin的lib库，然后打开codesys下的lib功能，重新安装库

7. 打开codesys目录下的wuxin应用程序，在前台重新下载codesys应用