#bin/sh
#This sh script is a hook for system start
	export PATH=/bin:/sbin:/usr/bin:/usr/sbin
	export LD_LIBRARY_PATH=/lib:/usr/lib
	export PATH=$PATH:/mnt/mmcblk1p2/usr/bin
	export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/lib/utils_lib:/usr/lib/qt_lib

	#opencv configuration
	export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/lib/opencv_lib:/usr/lib/opencv_lib/3rdparty

	#export TZ=UTC-08:00

	#mysql database configuration
	ln -s /mnt/mmcblk1p2/usr/config/my.cnf /etc/my.cnf
	ln -s /mnt/mmcblk1p2/usr/config/mysql.server /etc/init.d/mysqld
	ln -s /userdata/database/tmp/mysql.sock /tmp/mysql.sock
	export PATH=$PATH:/mnt/mmcblk1p2/usr/mysql/bin
	export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/mnt/mmcblk1p2/usr/mysql/lib/mysql

	#ts configuration  
	ln -s /mnt/mmcblk1p2/usr/config/pointercal /etc/pointercal                                                                                             
	export TSLIB_TSEVENTTYPE='INPUT'                                                         
	export TSLIB_CALIBFILE='/etc/pointercal'                                                 
	export TSLIB_CONFFILE='/etc/ts.conf'                                                     
	export TSLIB_CONSOLEDEVICE='none'                                                        
	export TSLIB_FBDEVICE='/dev/fb0'                                                         
	export TSLIB_PLUGINDIR='/usr/lib/qt_lib/ts'  
	export TSLIB_TSDEVICE='/dev/input/event1'     	

	#qt configuration  
	#export LD_LIBRARY_PATH=/usr/lib/qt_lib:$LD_LIBRARY_PATH	
	export QT_QWS_FONTDIR='/usr/lib/qt_lib/fonts'                                                   
	export QT_PLUGIN_PATH='/usr/lib/qt_lib/plugins/' 
	export QWS_DISPLAY='linuxfb:mmWidth50:mmHeight130:0'                                     
	#export QWS_SIZE=1024x600
	#export QWS_DISPLAY=Transformed:Rot90   
		             
	#export QWS_MOUSE_PROTO=tslib:/dev/input/event0 mouseman:/dev/input/mice'
	export QWS_MOUSE_PROTO='tslib:/dev/input/event1'

	#ethernet configuration
	/sbin/ifconfig eth0 192.168.1.253
	#/sbin/ifconfig eth0 netmask 255.255.255.0

	#I/O task configuration
	cd /userapp/
	#./IoTaskMIC7001 &
	sleep 1
	
	#update check script
	sh /mnt/mmcblk1p2/usr/config/update.sh

	#load config, update ip address, wifi name and wifi passwd here
	sh /mnt/mmcblk1p2/usr/config/loadconfig.sh

	cd /userapp/                                                             
    	#./mic7000d &
	sleep 1

	#codesys configuration
	cd /mnt/mmcblk1p2/usr/codesysctrl/
	./codesyscontrol &
	

	#can configuration
	#ifconfig can0 down	
	#canconfig can0 bitrate 250000
	#canconfig can0 ctrlmode loopback off
	#canconfig can0 start
	
	#ifconfig can1 down
	#canconfig can1 bitrate 250000
	#canconfig can1 ctrlmode loopback off
	#canconfig can1 start

	#wifi used for station
	#ln -s /mnt/mmcblk1p2/usr/config/wpa_supplicant.conf /etc/wpa_supplicant/wpa_supplicant.conf
	#wpa_supplicant -d -Dwext -iwlan0 -B -c /etc/wpa_supplicant/wpa_supplicant.conf
	#ifconfig wlan0 192.168.43.10 up
	#route add default gw 192.168.43.1

	#wifi used for AP
	ln -s /mnt/mmcblk1p2/usr/config/hostapd.conf /etc/hostapd.conf
	hostapd -B /etc/hostapd.conf
	ifconfig wlan0 192.168.2.253 up
	udhcpd /etc/udhcpd.conf

	#init mysql database, then start database
	#mysql_install_db --user=root --force --basedir=/mnt/mmcblk1p2/usr/mysql --datadir=/userdata/database/var/lib/mysql &
	#/etc/init.d/mysqld start &



        

