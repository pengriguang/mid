U����дϵͳ˵������Ҫ�ӵ��Դ��ڣ����������ڵ��Դ���������

U����дϵͳ���裺
1. ��PC�ϲ���U�̣���imageĿ¼�������ļ�����U���У�Ȼ��U�̲�����ʾ����������������������
   �û���Ҫȷ��U�̵Ĺ���Ŀ¼������U�̹��ص�/media/sda1Ŀ¼��������ص�����Ŀ¼����Ҫ���ݹ��ص�����Ŀ¼�޸�mk-emmc.sh�ļ�
   
cd /media/sda1/
sh mk-emmc.sh

2.	ϵͳ����ʱ���������������ʹֹ֮ͣ��u-boot��������ʾ���£�Ȼ����������
setenv ramdisk_img ramdisk.gz
setenv loadramdisk "fatload mmc ${mmcdev}:${mmcpart} ${initrd_addr} ${ramdisk_img}"
setenv bootargs "console=ttymxc0,115200 initrd=0x12C00000,64M  root=/dev/ram0  rw quiet boot_flag=ramdisk"
setenv boot_cyber "run loadimage && run loadfdt && run loadramdisk && bootz ${loadaddr} - ${fdt_addr}"
setenv bootcmd "run boot_cyber"
setenv bootdelay 1
saveenv
reset


3. ���¸�ʽ�����̣����½����ڶ�����Ŀ¼���ļ�
cd /media/sda1/
sh mk-system.sh
����ʾ��������  y

3.1 �����ʾ mount: mounting /dev/mmcblk3p2 on /mnt/mmcblk3p2/ failed: Device or resource busy ����ʾ
��  ctrl + c �жϲ�����Ȼ��������������
sh mk-system.sh

4. �޸���һ����
fsck.fat /dev/mmcblk3p1  
��1��Ȼ��y

5. ts_calibrate У׼������

6. ��codesys��ǰ̨���������ص�wuxin��lib�⣬Ȼ���codesys�µ�lib���ܣ����°�װ��

7. ��codesysĿ¼�µ�wuxinӦ�ó�����ǰ̨��������codesysӦ��