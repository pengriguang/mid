��ϵͳ�д�������Logo�ļ�������Logo�ļ�����Ҫ�滻�������²��裺
1. ��PC�ĵ����������½�updatLogoĿ¼���������ļ�startUpLogo.bmp��zImage���������Ŀ¼��
2. �Թ���ԱȨ�޴�PC�ϵ�tftpd32.exe�������������ǽ��ʾ����Ҫ������ܷ������磬Ȼ���������ť��������ղ��½����ļ��У�
3. ͨ��SecureCRT���繤�������Telnet��192.168.1.100����ʾ��������root�û���¼��
4. Ȼ�������������
	a. ����startUpLogo.bmp��zImage����ʾ��������PC��IP��ַΪ192.168.1.200
	cd 
	tftp  -gr  startUpLogo.bmp 192.168.1.200
	tftp  -gr  zImage 192.168.1.200
	ls -all
	
	b. ͨ�������ls ����鿴���鿴�ļ��Ƿ����سɹ������û�����سɹ������ܽ�����һ��

	c. �滻����һ������Logo��������������
    echo "Flashing Logo"
	export part_logo=4
	flash_eraseall /dev/mtd${part_logo} && nandwrite -p /dev/mtd${part_logo} -p startUpLogo.bmp
	
	d. �滻���ڶ���Logo��������������
	echo "Flashing kernel"
	export part_kernel=2
	flash_eraseall /dev/mtd${part_kernel} && nandwrite -p /dev/mtd${part_kernel} -p zImage
	
	e. ɾ�������ص���ʱ�ļ�
	rm  -rf  startUpLogo.bmp
	rm  -rf  zImage
	sync
	sync
	
	f. ������ʾ��
	reboot