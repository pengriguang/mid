在系统中存在两个Logo文件，两个Logo文件都需要替换，按如下步骤：
1. 在PC的电脑桌面上新建updatLogo目录，将升级文件startUpLogo.bmp和zImage拷贝到这个目录；
2. 以管理员权限打开PC上的tftpd32.exe，如果弹出防火墙提示，需要点击接受访问网络，然后点击浏览按钮，浏览到刚才新建的文件夹；
3. 通过SecureCRT网络工具软件，Telnet到192.168.1.100的显示屏，并且root用户登录；
4. 然后运行如下命令：
	a. 下载startUpLogo.bmp和zImage到显示屏，假设PC的IP地址为192.168.1.200
	cd 
	tftp  -gr  startUpLogo.bmp 192.168.1.200
	tftp  -gr  zImage 192.168.1.200
	ls -all
	
	b. 通过上面的ls 命令查看，查看文件是否下载成功，如果没有下载成功，不能进行下一步

	c. 替换掉第一个启动Logo，运行下面命令
    echo "Flashing Logo"
	export part_logo=4
	flash_eraseall /dev/mtd${part_logo} && nandwrite -p /dev/mtd${part_logo} -p startUpLogo.bmp
	
	d. 替换掉第二个Logo，运行下面命令
	echo "Flashing kernel"
	export part_kernel=2
	flash_eraseall /dev/mtd${part_kernel} && nandwrite -p /dev/mtd${part_kernel} -p zImage
	
	e. 删除掉下载的临时文件
	rm  -rf  startUpLogo.bmp
	rm  -rf  zImage
	sync
	sync
	
	f. 重启显示屏
	reboot