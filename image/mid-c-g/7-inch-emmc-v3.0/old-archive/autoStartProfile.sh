#bin/sh
#This sh script is a hook for system start
echo "4 4 1 7" > /proc/sys/kernel/printk
cd

#ts configuration  
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


if [ -f "/userapp/sn.txt" ]; then
	while read sn
	do
		break
	done < /userapp/sn.txt
	hostname $sn
fi
	
