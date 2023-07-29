#!/bin/bash
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
###########- COLOR CODE -##############
colornow=$(cat /etc/ssnvpn/theme/color.conf)
NC="\e[0m"
# // Exporting Language to UTF-8
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
###########- END COLOR CODE -##########
clear
cd
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
MYIP=$(curl -sS ipv4.icanhazip.com)
NameUser=$(curl -sS https://raw.githubusercontent.com/Rerechan02/izinvps/main/ip | grep $MYIP | awk '{print $2}')
cekdata=$(curl -sS https://raw.githubusercontent.com/Rerechan02/backup/main/$NameUser/$NameUser.zip | grep 404 | awk '{print $1}' | cut -d: -f1)
clear
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1│${NC} ${COLBG1}             • RESTOR PANEL MENU •             ${NC} $COLOR1│$NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
[[ "$cekdata" = "404" ]] && {
red "│  [INFO] Data not found / you never backup"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}" 
echo ""
read -n 1 -s -r -p "   Press any key to back on menu"
menu
} || {
echo "│  [INFO] Data found for username $nama"
}

echo -e "$COLOR1│${NC}  [ ${green}INFO${NC} ] • Restore Data..."
read -rp "│  Password File: " -e InputPass
echo -e "$COLOR1│${NC}  [ ${green}INFO${NC} ] • Downloading data.."
wget -q -O /root/backup/backup.zip "https://raw.githubusercontent.com/Rerechan02/backup/main/$nama/$nama.zip" &> /dev/null
echo -e "$COLOR1│${NC}  [ ${green}INFO${NC} ] • Getting your data..."
unzip -P $InputPass /root/backup/backup.zip &> /dev/null
echo -e "$COLOR1│${NC}  [ ${green}INFO${NC} ] • Starting to restore data..." 
 rm -f /root/backup/backup.zip &> /dev/null 
 sleep 1 
 cd /root/backup 
echo -e "$COLOR1│${NC}  [ ${green}INFO${NC} ] • Restoring passwd data..." 
sleep 1 
cp /root/backup/passwd /etc/ &> /dev/null 
echo -e "$COLOR1│${NC}  [ ${green}INFO${NC} ] • Restoring group data..." 
sleep 1 
cp /root/backup/group /etc/ &> /dev/null 
echo -e "$COLOR1│${NC}  [ ${green}INFO${NC} ] • Restoring shadow data..." 
sleep 1 
cp /root/backup/shadow /etc/ &> /dev/null 
echo -e "$COLOR1│${NC}  [ ${green}INFO${NC} ] • Restoring gshadow data..." 
sleep 1 
cp /root/backup/gshadow /etc/ &> /dev/null 
echo -e "$COLOR1│${NC}  [ ${green}INFO${NC} ] • Restoring chap-secrets data..." 
sleep 1 
cp /root/backup/chap-secrets /etc/ppp/ &> /dev/null 
echo -e "$COLOR1│${NC}  [ ${green}INFO${NC} ] • Restoring passwd1 data..." 
sleep 1 
cp /root/backup/passwd1 /etc/ipsec.d/passwd &> /dev/null 
echo -e "$COLOR1│${NC}  [ ${green}INFO${NC} ] Restoring ss.conf data..." 
sleep 1 
cp /root/backup/ss.conf /etc/shadowsocks-libev/ss.conf &> /dev/null 
echo -e "$COLOR1│${NC}  [ ${green}INFO${NC} ] • Restoring admin data..." 
sleep 1 
cp -r /root/backup/ssnvpn-pro /var/lib/ &> /dev/null 
cp -r /root/backup/.acme.sh /root/ &> /dev/null 
cp -r /root/backup/ssnvpn /etc/ &> /dev/null 
cp -r /root/backup/xray /etc/ &> /dev/null 
cp -r /root/backup/public_html /home/vps/ &> /dev/null 
cp -r /root/backup/crontab /etc/ &> /dev/null 
cp -r /root/backup/cron.d /etc/ &> /dev/null 
rm -rf /root/backup &> /dev/null 
echo -e "$COLOR1│${NC}  [ ${green}INFO${NC} ] • Done... Successfully - Funny Store." 
sleep 1 
rm -f /root/backup/backup.zip &> /dev/null 
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}" 
echo ""
read -n 1 -s -r -p "   Press any key to reboot"
reboot
