#!/bin/bash
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
vlx=$(grep -c -e "^#& " "/etc/xray/config.json")
let vla=$vlx/2
vmc=$(grep -c -e "^### " "/etc/xray/config.json")
let vma=$vmc/2
# VPS Information
tls_v2ray_status=$(systemctl status xray | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
nontls_v2ray_status=$(systemctl status xray | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
vless_tls_v2ray_status=$(systemctl status xray | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
vless_nontls_v2ray_status=$(systemctl status xray | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
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

# STATUS SERVICE  TLS 
if [[ $tls_v2ray_status == "running" ]]; then 
   status_tls_v2ray=" ${GREEN}Running${NC} ( No Error )"
else
   status_tls_v2ray="${RED}  Not Running${NC}   ( Error )"
fi

# STATUS SERVICE NON TLS V2RAY
if [[ $nontls_v2ray_status == "running" ]]; then 
   status_nontls_v2ray=" ${GREEN}Running ${NC}( No Error )${NC}"
else
   status_nontls_v2ray="${RED}  Not Running ${NC}  ( Error )${NC}"
fi

# STATUS SERVICE VLESS HTTPS
if [[ $vless_tls_v2ray_status == "running" ]]; then
  status_tls_vless=" ${GREEN}Running${NC} ( No Error )"
else
  status_tls_vless="${RED}  Not Running ${NC}  ( Error )${NC}"
fi

# STATUS SERVICE VLESS HTTP
if [[ $vless_nontls_v2ray_status == "running" ]]; then
  status_nontls_vless=" ${GREEN}Running${NC} ( No Error )"
else
  status_nontls_vless="${RED}  Not Running ${NC}  ( Error )${NC}"
fi
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
clear
echo -e "\033[1;93m┌─────────────────────────────────────────────────┐\033[0m"
echo -e "\033[1;93m│                  • XRAY MENU •                  \033[1;93m│"
echo -e "\e[33m└─────────────────────────────────────────────────┘\033[0m"
echo -e "\033[1;93m┌─────────────────────────────────────────────────┐\033[0m"
echo -e "❇️ XRAYS Vmess TLS         :$status_tls_v2ray"
echo -e "❇️ XRAYS Vmess None TLS    :$status_nontls_v2ray"
echo -e "❇️ XRAYS Vless TLS         :$status_tls_vless"
echo -e "❇️ XRAYS Vless None TLS    :$status_nontls_vless"
echo -e "❇️ XRAYS GRPC STATUS       :$status_nontls_vless"
echo -e "\e[33m└─────────────────────────────────────────────────┘\033[0m"
echo -e "${BICyan}\033[0m ${BOLD}  ${GREEN}  FN${BIYellow}  ${BIYellow}  VMESS  ${GREEN}  FN  ${BIYellow}  VLESS  ${GREEN}  FN $NC "
echo -e "${BICyan}\033[0m ${Blue}              $vma           $vla                         $NC"
echo -e "\033[1;93m┌─────────────────────────────────────────────────┐\033[0m"
echo -e "\033[1;93m│\033[0m            ${RED}SCRIPT BY RERECHAN STORE $NC \033[1;93m           │\033[0m"
echo -e "\033[1;93m└─────────────────────────────────────────────────┘\033[0m"
echo -e " [\e[36m•01\e[0m] Create Vmess         [\e[36m•06\e[0m] Create Vless"
echo -e " [\e[36m•02\e[0m] Trial Vmess          [\e[36m•07\e[0m] Trial Vless"
echo -e " [\e[36m•03\e[0m] Renew Vmess          [\e[36m•08\e[0m] Renew Vless"
echo -e " [\e[36m•04\e[0m] Dellete Vmess        [\e[36m•09\e[0m] Dellete Vless"
echo -e " [\e[36m•05\e[0m] Cek User Vmess       [\e[36m•10\e[0m] Cek User Vless"
echo -e ""
echo -e " [\e[36m•0\e[0m] Back To Menu          [\e[36m•x\e[0m] Exit"
echo -e ""
echo -e "\e[33m ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m" | lolcat
echo -e "${BICyan}$NC ${BICyan}HARI ini${NC}: ${red}$ttoday$NC ${BICyan}KEMARIN${NC}: ${red}$tyest$NC ${BICyan}BULAN${NC}: ${red}$tmon$NC $NC"
echo -e "\e[33m ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m" | lolcat
echo -e ""
read -p " Select menu :  "  opt
case $opt in
1) clear ; add-ws ; exit ;;
2) clear ; trialvmess ; exit ;;
3) clear ; renew-ws ; exit ;;
4) clear ; del-ws ; exit ;;
5) clear ; cek-ws ; exit ;;
6) clear ; add-vless ; exit ;;
7) clear ; trialvless ; exit ;;
8) clear ; renew-vless ; exit ;;
9) clear ; del-vless ; exit ;;
10) clear ; cek-vless ; exit ;;
0) clear ; menu ;;
x) exit ;;
*) echo "Anda salah tekan " ; sleep 1 ; xmenu ;;
esac