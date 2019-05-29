#bin/sh
#This sh script is a hook for system start
	export PATH=$PATH:/mnt/mmcblk3p2/usr/bin:/mnt/mmcblk3p2/usr/ubin:/mnt/mmcblk3p2/usr/usbin

	ln -s /mnt/mmcblk3p2/usr/touchconfig/pointercal /etc/pointercal
	
	# usb hotplug
	/usr/sbin/netlink &

	/sbin/ifconfig eth0 192.168.1.100
	/sbin/ifconfig eth0 netmask 255.255.255.0

	#wifi used for station
	#ln -s /mnt/mmcblk1p2/usr/wpaconfig/wpa_supplicant.conf /etc/wpa_supplicant/wpa_supplicant.conf
	#wpa_supplicant -d -Dwext -iwlan0 -B -c /etc/wpa_supplicant/wpa_supplicant.conf
	#ifconfig wlan0 192.168.2.252 up
	#route add default gw 192.168.2.253
	
	#can configuration
	ifconfig can0 down	
	canconfig can0 bitrate 250000
	canconfig can0 ctrlmode loopback off
	canconfig can0 start  
	
	#ts configuration                                                                                                     
	export TSLIB_TSEVENTTYPE='INPUT'                                                         
	export TSLIB_CALIBFILE='/etc/pointercal'                                                 
	export TSLIB_CONFFILE='/etc/ts.conf'                                                     
	export TSLIB_CONSOLEDEVICE='none'                                                        
	export TSLIB_FBDEVICE='/dev/fb0'                                                         
	export TSLIB_PLUGINDIR='/usr/lib/qt_lib/ts'  
    	export TSLIB_TSDEVICE='/dev/input/event0'     	

	#qt configuration  
	export LD_LIBRARY_PATH=/usr/lib/qt_lib:$LD_LIBRARY_PATH	
	export QT_QWS_FONTDIR='/usr/lib/qt_lib/fonts'                                                   
	export QT_PLUGIN_PATH='/usr/lib/qt_lib/plugins/' 
	export QWS_DISPLAY='linuxfb:mmWidth50:mmHeight130:0'                                     
	export QWS_SIZE=1024x768   
                             
	#export QWS_MOUSE_PROTO=tslib:/dev/input/event0 mouseman:/dev/input/mice'
	export QWS_MOUSE_PROTO='tslib:/dev/input/event0'
	export LD_LIBRARY_PATH=/usr/lib/opencv_lib:/usr/lib/opencv_lib/3rdparty:$LD_LIBRARY_PATH

	cd /mnt/mmcblk3p2/userapp/codesysctl/
	./codesyscontrol  &

