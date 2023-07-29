#!/bin/bash
DATE2=$(date -R | cut -d " " -f -5)
rm -fr setup.sh
#mkdir folder
mkdir /etc/xray
mkdir /etc/funny
mkdir /etc/funny/limit
mkdir /etc/funny/limit/trojan
mkdir /etc/funny/limit/vless
mkdir /etc/funny/limit/vmess
mkdir /etc/funny/limit/ssh
mkdir /etc/funny/limit/ssh/ip
mkdir /etc/funny/limit/trojan/ip
mkdir /etc/funny/limit/trojan/quota
mkdir /etc/funny/limit/vless/ip
mkdir /etc/funny/limit/vless/quota
mkdir /etc/funny/limit/vmess/ip
mkdir /etc/funny/limit/vmess/quota
mkdir /etc/funny/trojan
mkdir /etc/funny/vless
mkdir /etc/funny/vmess
mkdir /etc/funny/log
mkdir /etc/funny/log/trojan
mkdir /etc/funny/log/vless
mkdir /etc/funny/log/vmess
mkdir /etc/funny/log/ssh
mkdir /etc/funny/cache
mkdir /etc/funny/cache/trojan-tcp
mkdir /etc/funny/cache/trojan-ws
mkdir /etc/funny/cache/trojan-grpc
mkdir /etc/funny/cache/vless-ws
mkdir /etc/funny/cache/vless-grpc
mkdir /etc/funny/cache/vmess-ws
mkdir /etc/funny/cache/vmess-grpc
mkdir /etc/funny/cache/vmess-ws-orbit
mkdir /etc/funny/cache/vmess-ws-orbit1
apt install zip -y
apt install unzip -y
apt install curl -y
apt install wget -y
apt install htop -y
apt install jq -y
apt install curl -y
mkdir -p /etc/haproxy
apt install haproxy -y
rm -fr /etc/haproxy/haproxy.cfg
# BOT INFORMATION
export CHATID="6389176425"
export KEY="6230907878:AAExag4j8lRsJbMdAIv6T9STI1g6kp_Vq68"
export TIME="10"
export URL="https://api.telegram.org/bot$KEY/sendMessage"
IP=$(wget -qO- ipinfo.io/ip);
domain=$(cat /etc/xray/domain)
date=$(date +"%Y-%m-%d")
# > install gotop
gotop_latest="$(curl -s https://api.github.com/repos/xxxserxxx/gotop/releases | grep tag_name | sed -E 's/.*"v(.*)".*/\1/' | head -n 1)"
gotop_link="https://github.com/xxxserxxx/gotop/releases/download/v$gotop_latest/gotop_v"$gotop_latest"_linux_amd64.deb"
curl -sL "$gotop_link" -o /tmp/gotop.deb
dpkg -i /tmp/gotop.deb >/dev/null 2>&1

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


dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
#########################
#SETUP ALL INFORMATION
curl ipinfo.io/org > /root/.isp
curl ipinfo.io/city > /root/.city
curl ipinfo.io/org > /root/.myisp
curl ipinfo.io/city > /root/.mycity
curl ifconfig.me > /root/.ip
curl ipinfo.io/region > /root/.region
curl ifconfig.me > /root/.myip
clear
red='\e[1;31m'
green='\e[0;32m'
yell='\e[1;33m'
tyblue='\e[1;36m'
NC='\e[0m'
purple() { echo -e "\\033[35;1m${*}\\033[0m"; }
tyblue() { echo -e "\\033[36;1m${*}\\033[0m"; }
yellow() { echo -e "\\033[33;1m${*}\\033[0m"; }
green() { echo -e "\\033[32;1m${*}\\033[0m"; }
red() { echo -e "\\033[31;1m${*}\\033[0m"; }
cd /root
#System version number
if [ "${EUID}" -ne 0 ]; then
		echo "You need to run this script as root"
		exit 1
fi
if [ "$(systemd-detect-virt)" == "openvz" ]; then
		echo "OpenVZ is not supported"
		exit 1
fi

localip=$(hostname -I | cut -d\  -f1)
hst=( `hostname` )
dart=$(cat /etc/hosts | grep -w `hostname` | awk '{print $2}')
if [[ "$hst" != "$dart" ]]; then
echo "$localip $(hostname)" >> /etc/hosts
fi

mkdir -p /etc/xray
mkdir -p /etc/v2ray
mkdir -p /etc/slowdns
mkdir -p /etc/udp
touch /etc/xray/domain
touch /etc/v2ray/domain
touch /etc/xray/scdomain
touch /etc/v2ray/scdomain
ttet=`uname -r`
ReqPKG="linux-headers-$ttet"
if ! dpkg -s $ReqPKG  >/dev/null 2>&1; then
  rm /root/setup.sh >/dev/null 2>&1 
  exit
else
  clear
fi

secs_to_human() {
    echo "Installation time : $(( ${1} / 3600 )) hours $(( (${1} / 60) % 60 )) minute's $(( ${1} % 60 )) seconds"
}
start=$(date +%s)
ln -fs /usr/share/zoneinfo/Asia/Jakarta /etc/localtime
sysctl -w net.ipv6.conf.all.disable_ipv6=1 >/dev/null 2>&1
sysctl -w net.ipv6.conf.default.disable_ipv6=1 >/dev/null 2>&1

coreselect=''
cat> /root/.profile << END
# ~/.profile: executed by Bourne-compatible login shells.

if [ "$BASH" ]; then
  if [ -f ~/.bashrc ]; then
    . ~/.bashrc
  fi
fi

mesg n || true
clear
END
chmod 644 /root/.profile

echo -e "[ ${green}INFO${NC} ] Preparing the install file"
apt install git curl -y >/dev/null 2>&1
apt install python -y >/dev/null 2>&1
echo -e "[ ${green}INFO${NC} ] Aight good ... installation file is ready"
sleep 2
echo -ne "[ ${green}INFO${NC} ] Check permission : "
rm -rf /etc/per
mkdir -p /etc/per
touch /etc/per/id
touch /etc/per/token
mkdir -p /etc/dns
mkdir -p /etc/slowdns
touch /etc/slowdns/server.pub
touch /etc/slowdns/server.key
mkdir -p /etc/kuhing
mkdir -p /etc/kuhing/theme
mkdir -p /var/lib >/dev/null 2>&1
echo "IP=" >> /var/lib/ipvps.conf
echo ""
wget -q https://raw.githubusercontent.com/Rerechan02/indo-ssh/main/tools.sh;chmod +x tools.sh;./tools.sh
mkdir -p /etc/slowdns
rm tools.sh
clear
read -rp "Input your subdomain : " -e pp
read -rp "NSDomain: " -e NS_DOMAIN
clear
echo $NS_DOMAIN >/etc/xray/dns
echo $NS_DOMAIN >/etc/xray/nsdomain
echo $NS_DOMAIN >/etc/slowdns/nsdomain
echo "$pp" > /root/domain
echo "$pp" > /root/scdomain
echo "$pp" > /etc/xray/domain
echo "$pp" > /etc/xray/scdomain
echo "IP=$pp" > /var/lib/ipvps.conf
echo ""
clear
	wget -O dnstt-server "https://raw.githubusercontent.com/Rerechan02/indo-ssh/main/slowdns/dnstt-server" >/dev/null 2>&1
	chmod +x dnstt-server >/dev/null 2>&1
	wget -O dnstt-client "https://raw.githubusercontent.com/Rerechan02/indo-ssh/main/slowdns/dnstt-client" >/dev/null 2>&1
	chmod +x dnstt-client >/dev/null 2>&1
	./dnstt-server -gen-key -privkey-file server.key -pubkey-file server.pub
	chmod +x *
	mv * /etc/slowdns
	wget -O /etc/systemd/system/client.service "https://raw.githubusercontent.com/Rerechan02/indo-ssh/main/slowdns/client" >/dev/null 2>&1
	wget -O /etc/systemd/system/server.service "https://raw.githubusercontent.com/Rerechan02/indo-ssh/main/slowdns/server" >/dev/null 2>&1
	sed -i "s/xxxx/$NS_DOMAIN/g" /etc/systemd/system/client.service 
	sed -i "s/xxxx/$NS_DOMAIN/g" /etc/systemd/system/server.service
#Install PELANGI/LOLCAT
apt install ruby -y
apt install socat cron bash-completion ntpdate -y
gem install lolcat
apt install software-properties-common -y
apt install certbot python python2 -y
clear
#install ssh ovpn
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "$green      Install SSH / WS               $NC"
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
sleep 2
clear
wget https://raw.githubusercontent.com/Rerechan02/indo-ssh/main/ssh/ssh-vpn.sh && chmod +x ssh-vpn.sh && ./ssh-vpn.sh
#!/bin/bash
cd
wget -O /usr/local/bin/ws-dropbear https://raw.githubusercontent.com/Rerechan02/v/main/sshws/dropbear-ws.py
wget -O /usr/local/bin/ws-stunnel https://raw.githubusercontent.com/Rerechan02/v/main/sshws/ws-stunnel
#izin permision
#chmod +x /usr/local/bin/ws-openssh
chmod +x /usr/local/bin/ws-dropbear
chmod +x /usr/local/bin/ws-stunnel

#System Dropbear Websocket-SSH Python
wget -O /etc/systemd/system/ws-dropbear.service https://raw.githubusercontent.com/Rerechan02/v/main/sshws/service-wsdropbear && chmod +x /etc/systemd/system/ws-dropbear.service

#System SSL/TLS Websocket-SSH Python
wget -O /etc/systemd/system/ws-stunnel.service https://raw.githubusercontent.com/Rerechan02/v/main/sshws/ws-stunnel.service && chmod +x /etc/systemd/system/ws-stunnel.service
systemctl daemon-reload
systemctl enable ws-dropbear.service
systemctl start ws-dropbear.service
systemctl restart ws-dropbear.service
systemctl enable ws-stunnel.service
systemctl start ws-stunnel.service
systemctl restart ws-stunnel.service

#install ssh UDP
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "$green      Install SSH UDP CUSTOM               $NC"
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
sleep 2
clear
cd
wget https://raw.githubusercontent.com/Rerechan02/UDP/main/udp.sh && chmod +x udp.sh && ./udp.sh
wget https://raw.githubusercontent.com/Rerechan02/UDP/main/zi.sh && chmod +x zi.sh && ./zi.sh
wget https://raw.githubusercontent.com/Rerechan02/UDP/main/req.sh && chmod +x req.sh && ./req.sh
rm -fr zi.sh req.sh udp.sh
clear

#kwowo
cat> /etc/systemd/system/quota.service << END
[Unit]
Description=Checker Service

[Service]
Type=simple
Restart=always
ExecStart=/usr/sbin/loop

[Install]
WantedBy=multi-user.target
END
systemctl daemon-reload
systemctl enable quota
systemctl start quota

#Instal Xray
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "$green       Install XRAY              $NC"
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
sleep 2
clear
wget https://raw.githubusercontent.com/Rerechan02/indo-ssh/main/xray/ins-xray.sh && chmod +x ins-xray.sh && ./ins-xray.sh
clear

#Instal Xray
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "$green       SWAP RAM 1GB              $NC"
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
    # > Make a swap of 1GB
    dd if=/dev/zero of=/swapfile bs=1024 count=1048576
    mkswap /swapfile
    chown root:root /swapfile
    chmod 0600 /swapfile >/dev/null 2>&1
    swapon /swapfile >/dev/null 2>&1
    sed -i '$ i\/swapfile      swap swap   defaults    0 0' /etc/fstab
clear
cd /usr/sbin
wget https://raw.githubusercontent.com/Rerechan02/indo-ssh/main/funny.zip
unzip funny.zip
rm -fr funny.zip
clear
chmod +x /usr/sbin/*
cd
clear
clear
echo "0 1 * * * root delexp" >> /etc/crontab
echo "*/25 * * * * root clear-log" >> /etc/crontab
echo "*/15 * * * * root limit" >> /etc/crontab
echo "0 1 * * * root xp" >> /etc/crontab
clear
cat> /root/.profile << END
# ~/.profile: executed by Bourne-compatible login shells.

if [ "$BASH" ]; then
  if [ -f ~/.bashrc ]; then
    . ~/.bashrc
  fi
fi

mesg n || true
clear
menu
END
chmod 644 /root/.profile

if [ -f "/root/log-install.txt" ]; then
rm /root/log-install.txt > /dev/null 2>&1
fi
if [ -f "/etc/afak.conf" ]; then
rm /etc/afak.conf > /dev/null 2>&1
fi
if [ ! -f "/etc/log-create-user.log" ]; then
echo "Log All Account " > /etc/log-create-user.log
fi
history -c
echo $serverV > /opt/.ver
aureb=$(cat /home/re_otm)
b=11
if [ $aureb -gt $b ]
then
gg="PM"
else
gg="AM"
fi
curl -sS ifconfig.me > /etc/myipvps
rm /root/setup.sh >/dev/null 2>&1
rm /root/ins-xray.sh >/dev/null 2>&1
rm /root/renew_ssl.log >/dev/null 2>&1
rm /root/.bash_history >/dev/null 2>&1
rm /root/udp.sh >/dev/null 2>&1
rm /root/zi.sh >/dev/null 2>&1
rm /root/req.sh >/dev/null 2>&1
rm /root/ohp.sh >/dev/null 2>&1
rm /root/kuhing >/dev/null 2>&1
rm /root/set-br.sh >/dev/null 2>&1
rm /root/ssh-vpn.sh >/dev/null 2>&1
rm /root/insshws.sh >/dev/null 2>&1
clear
touch /root/system
echo -e "
"
TEXT="
Detail Install Script
==================================
IP VPS: $ip_vps
Domain: $(cat /etc/xray/domain)
Waktu Install: $DATE2
Client Name: $nama
Expired: $tanggal
==================================
"
clear
curl -s --max-time $TIME -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL >/dev/null
echo ""
clear
echo -e "
Detail Install Script
==================================
IP VPS        : $ip_vps
Domain        : $(cat /etc/xray/domain)
Date & Time   : $DATE2
Client Name   : $nama
Expired       : $tanggal
==================================
"
read -n 1 -s -r -p "Press any key to reboot"
reboot
