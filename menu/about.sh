#!/bin/bash
MYIP=$(wget -qO- ipinfo.io/ip);
echo "Checking VPS"
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
aureb=$(cat /home/re_otm)
clear
clear
echo " "
echo "Installation has been completed!!"
echo " "
clear  | tee -a log-install.txt
echo -e "\e[1;32m══════════════════ Autoscript PREMIUM ══════════════════\e[0m" | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "   >>> Service & Port"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "    [INFORMASI SSH SERVICE PORT]" | tee -a log-install.txt
echo "    -------------------------" | tee -a log-install.txt
echo "   - OpenSSH                 : 22"  | tee -a log-install.txt
echo "   - Stunnel4                : 8443, 8880"  | tee -a log-install.txt
echo "   - Slowdns                 : 443, 80, 53, 5300, 222"  | tee -a log-install.txt
echo "   - Udp Custom              : 7100-7900, 500-6000"  | tee -a log-install.txt
echo "   - Udp Zivpn [ Server ]    : [ ALL PORT SERVER ]"  | tee -a log-install.txt
echo "   - Udp Request             : [ 1 - 999999 ] / [ ALL PORT ]"  | tee -a log-install.txt
echo "   - Websocket SSH(HTTP)     : 80"  | tee -a log-install.txt
echo "   - Websocket SSL(HTTPS)    : 443"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "    [INFORMASI Grpc, Bdvp, Ngnx]" | tee -a log-install.txt
echo "    ---------------------------" | tee -a log-install.txt
echo "   - Badvpn                  : 7200, 7300"  | tee -a log-install.txt
echo "   - Nginx                   : 81"  | tee -a log-install.txt
echo "   - Grpc                    : 443"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "    [INFORMASI XRAY]"  | tee -a log-install.txt
echo "    ----------------" | tee -a log-install.txt
echo "   - Xray Vmess Ws Tls       : 443"  | tee -a log-install.txt
echo "   - Xray Vless Ws Tls       : 443"  | tee -a log-install.txt
echo "   - Xray Trojan Ws Tls      : 443"  | tee -a log-install.txt
echo "   - Xray Vmess Ws None Tls  : 80, 8080"  | tee -a log-install.txt
echo "   - Xray Vless Ws None Tls  : 80, 8080"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "   >>> Server Information & Other Features"  | tee -a log-install.txt
echo "   - Timezone                : Asia/Jakarta (GMT +7)"  | tee -a log-install.txt
echo "   - Fail2Ban                : [ON]"  | tee -a log-install.txt
echo "   - Dflate                  : [ON]"  | tee -a log-install.txt
echo "   - IPtables                : [ON]"  | tee -a log-install.txt
echo "   - Auto-Reboot             : [ON]"  | tee -a log-install.txt
echo "   - IPv6                    : [OFF]"  | tee -a log-install.txt
echo "   - Auto Delete Expired Account" | tee -a log-install.txt
echo "   - Full Orders For Various Services" | tee -a log-install.txt
echo "   - Whatsapp: 083120684925" | tee -a log-install.txt
echo "   - Telegram: @Rerechan02" | tee -a log-install.txt
echo "   - White Label" | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "   >>> Detail Order Script"  | tee -a log-install.txt
echo "    -------------------------" | tee -a log-install.txt
echo "   - Client Name    : $nama"
echo "   - IPv4 VPS       : $ip_vps"
echo "   - Domain VPS     : $(cat /etc/xray/domain)"
echo "   - Script Version : 1.2"
echo "   - Script Expired : $tanggal"
echo "    -------------------------" | tee -a log-install.txt
echo -e "\e[1;32m══════════════════ Autoscript By Rerechan02 ══════════════════\e[0m" | tee -a log-install.txt
echo ""
read -n 1 -s -r -p "Press any key to back on menu"
menu



