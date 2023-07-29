#!/bin/bash
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
uptime="$(uptime -p | cut -d " " -f 2-10)"
DATE2=$(date -R | cut -d " " -f -5)
tram=$(free -m | awk 'NR==2 {print $2}')
uram=$(free -m | awk 'NR==2 {print $3}')
fram=$(free -m | awk 'NR==2 {print $4}')
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
# Getting
# IP Validation
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
#########################
#link izin ip vps
url_izin='https://raw.githubusercontent.com/Rerechan02/iziznscript/main/ip'

# Mendapatkan IP VPS saat ini
ip_vps=$(curl -s ifconfig.me)

# Mendapatkan isi file izin.txt dari URL
izin=$(curl -s "$url_izin")

# Memeriksa apakah konten izin.txt berhasil didapatkan
if [[ -n "$izin" ]]; then
  while IFS= read -r line; do
    # Memisahkan nama VPS, IP VPS, dan tanggal kadaluwarsa
    nama=$(echo "$line" | awk '{print $1}')
    ipvps=$(echo "$line" | awk '{print $2}')
    tanggal=$(echo "$line" | awk '{print $3}')

    # Memeriksa apakah IP VPS saat ini cocok dengan IP VPS yang ada di izin.txt
    if [[ "$ipvps" == "$ip_vps" ]]; then
      echo "Nama VPS: $nama"
      echo "IP VPS: $ipvps"
      echo "Tanggal Kadaluwarsa: $tanggal"
      break
    fi
  done <<< "$izin"

  # Memeriksa apakah IP VPS ditemukan dalam izin.txt
  if [[ "$ipvps" != "$ip_vps" ]]; then
    echo "IP VPS tidak ditemukan dalam izin.txt"
    exit 0
  fi
else
  echo "Konten izin.txt tidak berhasil didapatkan dari URL"
  exit 0
fi



red='\e[1;31m'
green='\e[1;32m'
NC='\e[0m'
green() { echo -e "\\033[32;1m${*}\\033[0m"; }
red() { echo -e "\\033[31;1m${*}\\033[0m"; }
clear
# GETTING OS INFORMATION
source /etc/os-release
Versi_OS=$VERSION
ver=$VERSION_ID
Tipe=$NAME
URL_SUPPORT=$HOME_URL
basedong=$ID

# VPS ISP INFORMATION

echo -e "$ITAM"
REGION=$( curl -s ipinfo.io/region )
ISP=$(cat /usr/local/etc/xray/org)
CITY=$(cat /usr/local/etc/xray/city)
trgo="$(systemctl show trojan-go.service --no-page)"                                      
strgo=$(echo "${trgo}" | grep 'ActiveState=' | cut -f2 -d=)  

# CHEK STATUS 
tls_v2ray_status=$(systemctl status xray | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
nontls_v2ray_status=$(systemctl status xray | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
vless_tls_v2ray_status=$(systemctl status xray | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
vless_nontls_v2ray_status=$(systemctl status xray | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
shadowsocks=$(systemctl status xray | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
trojan_server=$(systemctl status xray | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
dropbear_status=$(/etc/init.d/dropbear status | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
stunnel_service=$(/etc/init.d/stunnel4 status | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
ssh_service=$(/etc/init.d/ssh status | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
vnstat_service=$(/etc/init.d/vnstat status | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
cron_service=$(/etc/init.d/cron status | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
fail2ban_service=$(/etc/init.d/fail2ban status | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
wstls=$(systemctl status ws-stunnel.service | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
wsdrop=$(systemctl status ws-dropbear.service | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
xray_service=$(systemctl status xray | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
nginx_service=$(systemctl status nginx | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
udpc=$(systemctl status udp-custom | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
dns1=$(systemctl status client.service | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
quo1=$(systemctl status quota | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
BadVPN2=$(systemctl status badvpn2 | grep active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g')
BadVPN3=$(systemctl status badvpn3 | grep active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g')
Ha1=$(systemctl status haproxy | grep active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g')
#STATUS SERVICE
# STATUS SERVICE HAPROXY
if [[ $Ha1 == "running" ]]; then
  status1="${GB}[ ON ]${NC}"
else
  status1="${RB}[ OFF ]${NC}"
fi
# STATUS SERVICE 7200
if [[ $BadVPN2 == "running" ]]; then
  status7200="${GB}[ ON ]${NC}"
else
  status7200="${RB}[ OFF ]${NC}"
fi
# STATUS SERVICE 7300
if [[ $BadVPN3 == "running" ]]; then
  status7300="${GB}[ ON ]${NC}"
else
  status7300="${RB}[ OFF ]${NC}"
fi

#xray
if [[ $xray_service == "running" ]]; then
status_xray="${GB}[ ON ]${NC}"
else
status_xray="${RB}[ OFF ]${NC}"
fi
if [[ $nginx_service == "running" ]]; then
status_nginx="${GB}[ ON ]${NC}"
else
status_nginx="${RB}[ OFF ]${NC}"
fi
clear

# STATUS SERVICE OPENVPN
if [[ $oovpn == "active" ]]; then
  status_openvpn="${GB}[ ON ]${NC}"
else
  status_openvpn="${RB}[ OFF ]${NC}"
fi

# STATUS SERVICE  SSH 
if [[ $ssh_service == "running" ]]; then 
   status_ssh="${GB}[ ON ]${NC}"
else
   status_ssh="${RB}[ OFF ]${NC}"
fi

# STATUS SERVICE  SQUID 
if [[ $squid_service == "running" ]]; then 
   status_squid="${GB}[ ON ]${NC}"
else
   status_squid="${RB}[ OFF ]${NC}"
fi

# STATUS SERVICE  VNSTAT 
if [[ $vnstat_service == "running" ]]; then 
   status_vnstat="${GB}[ ON ]${NC}"
else
   status_vnstat="${RB}[ OFF ]${NC}"
fi

# STATUS SERVICE  CRONS 
if [[ $cron_service == "running" ]]; then 
   status_cron="${GB}[ ON ]${NC}"
else
   status_cron="${RB}[ OFF ]${NC}"
fi

# STATUS SERVICE  FAIL2BAN 
if [[ $fail2ban_service == "running" ]]; then 
   status_fail2ban="${GB}[ ON ]${NC}"
else
   status_fail2ban="${RB}[ OFF ]${NC}"
fi

# STATUS SERVICE  TLS 
if [[ $tls_v2ray_status == "running" ]]; then 
   status_tls_v2ray="${GB}[ ON ]${NC}${NC}"
else
   status_tls_v2ray="${RB}[ OFF ]${NC}"
fi

# STATUS SERVICE NON TLS V2RAY
if [[ $nontls_v2ray_status == "running" ]]; then 
   status_nontls_v2ray="${GB}[ ON ]${NC}${NC}"
else
   status_nontls_v2ray="${RB}[ OFF ]${NC}"
fi

# STATUS SERVICE VLESS HTTPS
if [[ $vless_tls_v2ray_status == "running" ]]; then
  status_tls_vless="${GB}[ ON ]${NC}${NC}"
else
  status_tls_vless="${RB}[ OFF ]${NC}"
fi

# STATUS SERVICE VLESS HTTP
if [[ $vless_nontls_v2ray_status == "running" ]]; then
  status_nontls_vless="${GB}[ ON ]${NC}${NC}"
else
  status_nontls_vless="${RB}[ OFF ]${NC}"
fi
# STATUS SERVICE TROJAN
if [[ $trojan_server == "running" ]]; then 
   status_virus_trojan="${GB}[ ON ]${NC}${NC}"
else
   status_virus_trojan="${RB}[ OFF ]${NC}"
fi
# STATUS SERVICE DROPBEAR
if [[ $dropbear_status == "running" ]]; then 
   status_beruangjatuh="${GB}[ ON ]${NC}${NC}${NC}"
else
   status_beruangjatuh="${RB}[ OFF ]${NC}"
fi

# STATUS SERVICE STUNNEL
if [[ $stunnel_service == "running" ]]; then 
   status_stunnel="${GB}[ ON ]${NC}"
else
   status_stunnel="${RB}[ OFF ]${NC}"
fi
# STATUS SERVICE WEBSOCKET TLS
if [[ $wstls == "running" ]]; then 
   swstls="${GB}[ ON ]${NC}${NC}"
else
   swstls="${RB}[ OFF ]${NC}"
fi

# STATUS SERVICE WEBSOCKET DROPBEAR
if [[ $wsdrop == "running" ]]; then 
   swsdrop="${GB}[ ON ]${NC}${NC}"
else
   swsdrop="${RB}[ OFF ]${NC}"
fi

# STATUS SHADOWSOCKS
if [[ $shadowsocks == "running" ]]; then 
   status_shadowsocks="${GB}[ ON ]${NC}${NC}"
else
   status_shadowsocks="${RB}[ OFF ]${NC}"
fi

# STATUS SERVICE UDP CUSTOM
if [[ $udpc == "running" ]]; then
   udp2="${GB}[ ON ]${NC}${NC}"
else
   udp2="${RB}[ OFF ]${NC}"
fi

# STATUS SERVICE UDP CUSTOM
if [[ $dns1 == "running" ]]; then
   dns="${GB}[ ON ]${NC}${NC}"
else
   dns="${RB}[ OFF ]${NC}"
fi

# Status Service Trojan GO
if [[ $strgo == "active" ]]; then
  status_trgo="${GB}[ ON ]${NC}${NC}"
else
  status_trgo="${RB}[ OFF ]${NC}"
fi


# STATUS SERVICE LIMIT QUOTA
if [[ $quo1 == "running" ]]; then
   quo="${GB}[ ON ]${NC}${NC}"
else
   quo="${RB}[ OFF ]${NC}"
fi

# TOTAL RAM
total_ram=` grep "MemTotal: " /proc/meminfo | awk '{ print $2}'`
totalram=$(($total_ram/1024))

# KERNEL TERBARU
kernelku=$(uname -r)

# DNS PATCH
#tipeos2=$(uname -m)
# GETTING DOMAIN NAME
Domen="$(cat /etc/xray/domain)"
echo -e ""
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "\E[44;1;39m          ⇱ Subscription Information ⇲          \E[0m"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "❇️ Client Name : $nama"
echo -e "❇️ Exp Script  : $tanggal"
echo -e "❇️ Version     : 7.0"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "\E[44;1;39m             ❇ $(cat /etc/xray/domain) ❇           \E[0m"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "\e[33m❇\033[0m  SSH DROPBEAR   :$status_beruangjatuh"
echo -e "\e[33m❇\033[0m  LIMIT QUOTA    :$quo"
echo -e "\e[33m❇\033[0m  SSLH MOD FN    :$status_beruangjatuh"
echo -e "\e[33m❇\033[0m  XRAY ALL       :$status_tls_v2ray"
echo -e "\e[33m❇\033[0m  GOLANG         :$status_nginx"
echo -e "\e[33m❇\033[0m  APACHE2 LOAD   :$status_nginx"
echo -e "\e[33m❇\033[0m  NGINX REDIRECT :$status_nginx"
echo -e "\e[33m❇\033[0m  IGINTER GO     :$status_trgo"
echo -e "\e[33m❇\033[0m  HAPROXY TCP    :$status1"
echo -e "\e[33m❇\033[0m  SSH HTTPS      :$swstls"
echo -e "\e[33m❇\033[0m  SSH HTTP       :$swstls"
echo -e "\e[33m❇\033[0m  SLOWDNS        :$dns"
echo -e "\e[33m❇\033[0m  SSH UDP        :$udp2"
echo -e "\e[33m❇\033[0m  7200           :$status7200"
echo -e "\e[33m❇\033[0m  7300           :$status7300"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "${BICyan}$NC ${BICyan}HARI ini${NC}: ${red}$ttoday$NC ${BICyan}BULAN${NC}: ${red}$tmon$NC $NC"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
read -n 1 -s -r -p "Press any key to back on menu"

menu
