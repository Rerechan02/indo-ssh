clear
# pewarna hidup
GREEN='\033[0;32m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
BGreen='\e[1;32m'
BYellow='\e[1;33m'
BBlue='\e[1;34m'
BPurple='\e[1;35m'
NC='\033[0m'
yl='\e[32;1m'
bl='\e[36;1m'
gl='\e[32;1m'
rd='\e[31;1m'
mg='\e[0;95m'
blu='\e[34m'
op='\e[35m'
or='\033[1;33m'
bd='\e[1m'
color1='\e[031;1m'
color2='\e[34;1m'
color3='\e[0m'
# COLOR VALIDATION
RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHT='\033[0;37m'
RB='\e[31;1m'
GB='\e[32;1m'
YB='\e[33;1m'
BB='\e[34;1m'
MB='\e[35;1m'
CB='\e[35;1m'
WB='\e[37;1m'
systemctl daemon-reload

dns1=$(systemctl status client.service | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
# STATUS SERVICE UDP CUSTOM
if [[ $dns1 == "running" ]]; then
   dns="${GB}[ ON ]${NC}${NC}"
else
   dns="${RB}[ OFF ]${NC}"
fi
udpc=$(systemctl status udp-custom | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
# STATUS SERVICE UDP CUSTOM
if [[ $udpc == "running" ]]; then
   udp2="${GB}[ ON ]${NC}${NC}"
else
   udp2="${RB}[ OFF ]${NC}"
fi

echo -e "\033[1;93m┌─────────────────────────────────────────────────┐\033[0m"
echo -e "\033[1;93m│                • DNSTT MENU •                   \033[1;93m│"
echo -e "\e[33m└─────────────────────────────────────────────────┘\033[0m"
echo -e "\033[1;93m┌─────────────────────────────────────────────────┐\033[0m"
echo -e "\e[33m❇\033[0m  DNS TUNNEL             :$dns"
echo -e "\e[33m❇\033[0m  UDP TUNNEL             :$udp2"
echo -e "\e[33m└─────────────────────────────────────────────────┘\033[0m"
echo -e " [\e[36m•01\e[0m] Turn On Slowdns      [\e[36m•03\e[0m] Turn On ssh udp"
echo -e " [\e[36m•02\e[0m] Turn On Slowdns      [\e[36m•04\e[0m] Turn Off ssh udp"
echo -e "\033[1;93m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[1;93m"
echo -e ""
read -p " Select menu :  "  opt
case $opt in
1) clear ; systemctl enable client && systemctl enable server && systemctl start client && systemctl start server ; menu ;;
2) clear ; systemctl stop client && systemctl stop server && systemctl disable client && systemctl stop server && systemctl disble server ; menu ;;
3) systemctl enable udp-custom && systemctl start udp-custom ;;
4) systemctl stop udp-custom && systemctl disable udp-custom ;;
*) echo "Anda salah tekan " ; sleep 1 ; dmenu ;;
esac
