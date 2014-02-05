#!/bin/bash
clear
rm -f settings.txt &>/dev/null

echo "Starting up IP-Changer"

if [ ! -f /usr/bin/xfce4-terminal ];then
	apt-get install xfce4-terminal &>/dev/null

elif [ ! -f /usr/sbin/tor ];then
	apt-get install tor &>/dev/null

elif [ ! -f /usr/bin/firefox ]; then
	apt-get install firefox &>/dev/null

elif  [ ! -f /usr/bin/iceweasel ]; then
	apt-get install iceweasel &>/dev/null
	echo firefox=1 > settings.txt
fi

xfce4-terminal -H -T "IP CHANGER" --geometry=32x9-0-0 -x ./ip-changer.sh