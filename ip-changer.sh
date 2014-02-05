#!/bin/bash
clear
. settings.txt

new_ip(){
service tor restart 
}

echo -en "\e[1mSet time to change IP: \e[0m"
read time
echo
new_ip
sleep 3
clear

if [ $firefox == 1 ]; then
	xfce4-terminal --geometry=134x9+0-0 -H -T proxychains -x proxychains firefox -private dnsleaktest.com
else
	xfce4-terminal --geometry=134x9+0-0 -H -T proxychains -x proxychains iceweasel dnsleaktest.com
fi

count(){
for (( i=$time; i>0; i--)); do
        sleep 1 &
        printf "Next IP in ... \e[1;36m$i \r\e[0m"
		wait
        done
}

c_c(){
service tor stop
echo -e "\e[1;31mTor has been stopped.\nYou are no longer proxied! \n\e[0m"
exit
}

trap c_c 2

for (( ; ; )); do
count
new_ip
echo;echo;echo
done