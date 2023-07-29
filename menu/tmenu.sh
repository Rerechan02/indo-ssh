#!/bin/bash
#########################
trgo="$(systemctl show trojan-go.service --no-page)"
trojan_server=$(systemctl status xray | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
strgo=$(echo "${trgo}" | grep 'ActiveState=' | cut -f2 -d=)
# STATUS SERVICE TROJAN
if [[ $trojan_server == "running" ]]; then 
   status_virus_trojan=" ${GREEN}Running ${NC}( No Error )${NC}"
else
   status_virus_trojan="${RED}  Not Running ${NC}  ( Error )${NC}"
fi
# Status Service Trojan GO
if [[ $strgo == "active" ]]; then
  status_trgo=" ${GREEN}Running ${NC}( No Error )${NC}"
else
  status_trgo="${RED}  Not Running ${NC}  ( Error )${NC}"
fi
#uwew guys,
trx=$(grep -c -E "^#! " "/etc/xray/config.json")
let tra=$trx/2
ssx=$(grep -c -E "### " "/etc/trojan-go/akun.conf")
let ssa=$ssx/2
# Color Validation
DF='\e[39m'
Bold='\e[1m'
Blink='\e[5m'
yell='\e[33m'
red='\e[31m'
green='\e[32m'
blue='\e[34m'
PURPLE='\e[35m'
cyan='\e[36m'
Lred='\e[91m'
Lgreen='\e[92m'
Lyellow='\e[93m'
NC='\e[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
LIGHT='\033[0;37m'
# VPS Information
#Domain
domain=$(cat /etc/xray/domain)
#Status certificate
modifyTime=$(stat $HOME/.acme.sh/${domain}_ecc/${domain}.key | sed -n '7,6p' | awk '{print $2" "$3" "$4" "$5}')
modifyTime1=$(date +%s -d "${modifyTime}")
currentTime=$(date +%s)
stampDiff=$(expr ${currentTime} - ${modifyTime1})
days=$(expr ${stampDiff} / 86400)
remainingDays=$(expr 90 - ${days})
tlsStatus=${remainingDays}
if [[ ${remainingDays} -le 0 ]]; then
	tlsStatus="expired"
fi
# OS Uptime
uptime="$(uptime -p | cut -d " " -f 2-10)"
# Download
#Download/Upload today
dtoday="$(vnstat -i eth0 | grep "today" | awk '{print $2" "substr ($3, 1, 1)}')"
utoday="$(vnstat -i eth0 | grep "today" | awk '{print $5" "substr ($6, 1, 1)}')"
ttoday="$(vnstat -i eth0 | grep "today" | awk '{print $8" "substr ($9, 1, 1)}')"
#Download/Upload yesterday
dyest="$(vnstat -i eth0 | grep "yesterday" | awk '{print $2" "substr ($3, 1, 1)}')"
uyest="$(vnstat -i eth0 | grep "yesterday" | awk '{print $5" "substr ($6, 1, 1)}')"
tyest="$(vnstat -i eth0 | grep "yesterday" | awk '{print $8" "substr ($9, 1, 1)}')"
#Download/Upload current month
dmon="$(vnstat -i eth0 -m | grep "`date +"%b '%y"`" | awk '{print $3" "substr ($4, 1, 1)}')"
umon="$(vnstat -i eth0 -m | grep "`date +"%b '%y"`" | awk '{print $6" "substr ($7, 1, 1)}')"
tmon="$(vnstat -i eth0 -m | grep "`date +"%b '%y"`" | awk '{print $9" "substr ($10, 1, 1)}')"
# Getting CPU Information
cpu_usage1="$(ps aux | awk 'BEGIN {sum=0} {sum+=$3}; END {print sum}')"
cpu_usage="$((${cpu_usage1/\.*} / ${corediilik:-1}))"
cpu_usage+=" %"
ISP=$(curl -s ipinfo.io/org | cut -d " " -f 2-10 )
CITY=$(curl -s ipinfo.io/city )
WKT=$(curl -s ipinfo.io/timezone )
DAY=$(date +%A)
DATE=$(date +%m/%d/%Y)
IPVPS=$(curl -s ipinfo.io/ip )
cname=$( awk -F: '/model name/ {name=$2} END {print name}' /proc/cpuinfo )
cores=$( awk -F: '/model name/ {core++} END {print core}' /proc/cpuinfo )
freq=$( awk -F: ' /cpu MHz/ {freq=$2} END {print freq}' /proc/cpuinfo )
tram=$( free -m | awk 'NR==2 {print $2}' )
uram=$( free -m | awk 'NR==2 {print $3}' )
fram=$( free -m | awk 'NR==2 {print $4}' )
clear
echo -e "\033[1;93m┌─────────────────────────────────────────────────┐\033[0m"
echo -e "\033[1;93m│                • TROJAN MENU •                  \033[1;93m│"
echo -e "\e[33m└─────────────────────────────────────────────────┘\033[0m"
echo -e "❇️ XRAYS Trojan            :$status_virus_trojan"
echo -e "❇️ Trojan GO               :$status_trgo"
echo -e "❇️ V2RAY Trojan            :$status_trgo"
echo -e "❇️ GRPC STATUS             :$status_virus_trojan"
echo -e "\033[1;93m┌─────────────────────────────────────────────────┐\033[0m"
echo -e "${BICyan}\033[0m ${BOLD}          ${GREEN}FN  ${BIYellow} TROJAN    TROJAN GO ${GREEN}FN $NC "
echo -e "${BICyan}\033[0m ${Blue}                  $tra         $ssa $NC"
echo -e "\e[33m└─────────────────────────────────────────────────┘\033[0m"
echo -e "\033[1;93m┌─────────────────────────────────────────────────┐\033[0m"
echo -e "\033[1;93m│\033[0m            ${RED}SCRIPT BY RERECHAN STORE $NC \033[1;93m           │\033[0m"
echo -e "\033[1;93m└─────────────────────────────────────────────────┘\033[0m"
echo -e " [\e[36m•01\e[0m] Create Trojan1         [\e[36m•06\e[0m] Create Trojan2"
echo -e " [\e[36m•02\e[0m] Trial Trojan1          [\e[36m•07\e[0m] Trial Trojan2"
echo -e " [\e[36m•03\e[0m] Renew Trojan1          [\e[36m•08\e[0m] Renew Trojan2"
echo -e " [\e[36m•04\e[0m] Dellete Trojan1        [\e[36m•09\e[0m] Dellete Trojan2"
echo -e " [\e[36m•05\e[0m] Cek User Trojan1       [\e[36m•10\e[0m] Cek User Trojan2"
echo -e ""
echo -e " [\e[36m•0\e[0m] Back To Menu            [\e[36m•x\e[0m] Exit"
echo -e ""
echo -e "\033[1;93m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[1;93m"
echo -e ""
read -p " Select menu :  "  opt
case $opt in
1) clear ; add-tr ;;
2) clear ; trialtrojan ;;
3) clear ; renew-tr ;;
4) clear ; del-tr ;;
5) clear ; cek-tr ;;
6) clear ; addtrgo ;;
7) clear ; trialtrojango ;;
8) clear ; renewtrgo ;;
9) clear ; deltrgo ;;
10) clear ; cektrgo ;;
0) clear ; menu ;;
x) exit ;;
*) echo "Anda salah tekan " ; sleep 1 ; xmenu ;;
esac