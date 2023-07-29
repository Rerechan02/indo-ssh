#!/bin/bash
BIBlack='\033[1;90m'      # Black
BIRed='\033[1;91m'        # Red
BIGreen='\033[1;92m'      # Green
BIYellow='\033[1;93m'     # Yellow
BIBlue='\033[1;94m'       # Blue
BIPurple='\033[1;95m'     # Purple
BICyan='\033[1;96m'       # Cyan
BIWhite='\033[1;97m'      # White
UWhite='\033[4;37m'       # White
On_IPurple='\033[0;105m'  #
On_IRed='\033[0;101m'
IBlack='\033[0;90m'       # Black
IRed='\033[0;91m'         # Red
IGreen='\033[0;92m'       # Green
IYellow='\033[0;93m'      # Yellow
IBlue='\033[0;94m'        # Blue
IPurple='\033[0;95m'      # Purple
ICyan='\033[0;96m'        # Cyan
IWhite='\033[0;97m'       # White
NC='\e[0m'
green() { echo -e "\\033[32;1m${*}\\033[0m"; }
red() { echo -e "\\033[31;1m${*}\\033[0m"; }
# // Exporting Language to UTF-8

export LANG='en_US.UTF-8'
export LANGUAGE='en_US.UTF-8'


# // Export Color & Information
export RED='\033[0;31m'
export GREEN='\033[0;32m'
export YELLOW='\033[0;33m'
export BLUE='\033[0;34m'
export PURPLE='\033[0;35m'
export CYAN='\033[0;36m'
export LIGHT='\033[0;37m'
export NC='\033[0m'
MYIP=$(wget -qO- ipinfo.io/ip);
echo "Checking VPS"
clear
echo -e "\e[33m ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"|lolcat
echo -e "                 • SYSTEM MENU •                 "
echo -e "\e[33m ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"|lolcat
echo -e ""
echo -e " [\e[36m•01\e[0m] Ganti Domain"
echo -e " [\e[36m•02\e[0m] Speedtest vps"
echo -e " [\e[36m•03\e[0m] Restart All service"
echo -e " [\e[36m•04\e[0m] Cek Cpu & Ram"
echo -e " [\e[36m•05\e[0m] Generate cert ssl"
echo -e " [\e[36m•06\e[0m] Ganti Nameserver Slowdns"
echo -e " [\e[36m•07\e[0m] Renew Pubkey & Private Key Slowdns"
echo -e " [\e[36m•08\e[0m] Turn On / Off Slowdns Service Running"
echo -e " [\e[36m•09\e[0m] Monitoring VPS / cek cpu/gpu/ram/quota/bw"
echo -e " [\e[36m•10\e[0m] Backup & Restore data vps"
echo -e ""
echo -e " [\e[36m•0\e[0m] Back to Menu"
echo -e ""
echo -e "\e[33m ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"|lolcat
echo -e ""
read -p " Select menu : " opt
echo -e ""
case $opt in
01|1) clear ; add-host ; exit ;;
02|2) clear ; speedtest ; exit ;;
03|3) clear ; restart ; exit ;;
04|4) clear ; htop ; exit ;;
05|5) clear ; certv2ray ; exit ;;
06|6) clear ; nsmenu ; exit ;;
07|7) clear ; pubkey ; exit ;;
08|8) clear ; dmenu ; exit ;;
09|9) clear ; gotop ; exit ;;
10) clear ; bmenu ; exit ;;
0) clear ; menu ; exit ;;
x) exit ;;
*) echo -e "" ; echo "Anda salah tekan" ; sleep 1 ; menu-set ;;
esac