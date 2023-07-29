#!/bin/bash
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
#########################

cekray=`cat /root/log-install.txt | grep -ow "XRAY" | sort | uniq`

clear
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "Domain anda saat ini:"
echo -e "$(cat /etc/xray/domain)"
echo ""
read -rp "Domain/Host: " -e host
echo ""
if [ -z $host ]; then
echo "DONE CHANGE DOMAIN"
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
read -n 1 -s -r -p "Press any key to back on menu"
menu
else
echo "IP=$host" > /var/lib/ipvps.conf
echo "$host" > /etc/xray/domain
echo "$host" > /root/domain
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo "Dont forget to renew cert"
echo ""
read -n 1 -s -r -p "Press any key to renew cert"
certv2ray
fi
