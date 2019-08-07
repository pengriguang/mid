#!/bin/bash
#echo "load config script begin."
sn=''
wifi_passwd=''
ip=''

if [ -f "/userapp/sn.txt" ]; then
	while read sn
	do
		break
	done < /userapp/sn.txt
	#echo $sn
	hostname $sn
fi

if [ -f "/userapp/wifi_passwd.txt" ]; then
	while read wifi_passwd
	do
		break
	done < /userapp/wifi_passwd.txt
fi

#echo $sn
#echo $wifi_passwd

if [ -f "/etc/hostapd.conf" ] && [ -n "$sn" ] && [ -n "$wifi_passwd" ]; then
	#echo "change ssid and passwd"
	while read line; do
		name=`echo $line|awk -F '=' '{print $1}'`
		value=`echo $line|awk -F '=' '{print $2}'`
		case $name in
		"ssid")
			ssid=$value
			;;
		"wpa_passphrase")
			wpa_passphrase=$value
			break
			;;
		*)
			;;
	esac
	done < /etc/hostapd.conf
	
	#echo $ssid
	#echo $wpa_passphrase
	
	if [ "$sn"x != "$ssid"x ]  || [ "$wifi_passwd"x != "$wpa_passphrase"x ]; then
		#echo "ssid and passwd not equal"
		ssid_sn='s/'$ssid'/'$sn'/g'
		wpa_passphrase_wifi_passwd='s/'$wpa_passphrase'/'$wifi_passwd'/g'
		#echo $ssid_sn
		#echo $wpa_passphrase_wifi_passwd
		sed -i  $ssid_sn  /etc/hostapd.conf
		sed -i  $wpa_passphrase_wifi_passwd  /etc/hostapd.conf
	fi
fi

if [ -f "/userapp/ipaddr.txt" ]; then
	while read ip
	do
		break
	done < /userapp/ipaddr.txt

	ifconfig eth0 $ip
fi

#echo "load config script finish."
