#!/bin/bash
#
# ==================================================

# initializing var
export DEBIAN_FRONTEND=noninteractive
MYIP=$(wget -qO- ipinfo.io/ip);
MYIP2="s/xxxxxxxxx/$MYIP/g";
NET=$(ip -o $ANU -4 route show to default | awk '{print $5}');
source /etc/os-release
ver=$VERSION_ID

#detail nama perusahaan
country=ID
state=Indonesia
locality=Jawa,Tengah
organization=none
organizationalunit=none
commonname=none
email=rere@gmail.com

# simple password minimal
curl -sS https://raw.githubusercontent.com/Rerechan02/indo-ssh/main/ssh/password | openssl aes-256-cbc -d -a -pass pass:scvps07gg -pbkdf2 > /etc/pam.d/common-password
chmod +x /etc/pam.d/common-password

# go to root
cd

# Edit file /etc/systemd/system/rc-local.service
cat > /etc/systemd/system/rc-local.service <<-END
[Unit]
Description=/etc/rc.local
ConditionPathExists=/etc/rc.local
[Service]
Type=forking
ExecStart=/etc/rc.local start
TimeoutSec=0
StandardOutput=tty
RemainAfterExit=yes
SysVStartPriority=99
[Install]
WantedBy=multi-user.target
END

# nano /etc/rc.local
cat > /etc/rc.local <<-END
#!/bin/sh -e
# rc.local
# By default this script does nothing.
exit 0
END

# Ubah izin akses
chmod +x /etc/rc.local

# enable rc local
systemctl enable rc-local
systemctl start rc-local.service

# disable ipv6
echo 1 > /proc/sys/net/ipv6/conf/all/disable_ipv6
sed -i '$ i\echo 1 > /proc/sys/net/ipv6/conf/all/disable_ipv6' /etc/rc.local

#update
apt update -y
apt upgrade -y
apt dist-upgrade -y
apt-get remove --purge ufw firewalld -y
apt-get remove --purge exim4 -y

#install jq
apt -y install jq

#install shc
apt -y install shc

# install wget and curl
apt -y install wget curl

#figlet
apt-get install figlet -y
apt-get install ruby -y
gem install lolcat

# set time GMT +7
ln -fs /usr/share/zoneinfo/Asia/Jakarta /etc/localtime

# set locale
sed -i 's/AcceptEnv/#AcceptEnv/g' /etc/ssh/sshd_config


install_ssl(){
    if [ -f "/usr/bin/apt-get" ];then
            isDebian=`cat /etc/issue|grep Debian`
            if [ "$isDebian" != "" ];then
                    apt-get install -y nginx certbot
                    apt install -y nginx certbot
                    sleep 3s
            else
                    apt-get install -y nginx certbot
                    apt install -y nginx certbot
                    sleep 3s
            fi
    else
        yum install -y nginx certbot
        sleep 3s
    fi

    systemctl stop nginx.service

    if [ -f "/usr/bin/apt-get" ];then
            isDebian=`cat /etc/issue|grep Debian`
            if [ "$isDebian" != "" ];then
                    echo "A" | certbot certonly --renew-by-default --register-unsafely-without-email --standalone -d $domain
                    sleep 3s
            else
                    echo "A" | certbot certonly --renew-by-default --register-unsafely-without-email --standalone -d $domain
                    sleep 3s
            fi
    else
        echo "Y" | certbot certonly --renew-by-default --register-unsafely-without-email --standalone -d $domain
        sleep 3s
    fi
}

# install webserver
apt -y install nginx
cd
rm /etc/nginx/sites-enabled/default
rm /etc/nginx/sites-available/default
mkdir -p /home/vps/public_html
/etc/init.d/nginx restart

# install badvpn
cd

# setting port ssh
cd
sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
sed -i '/Port 22/a Port 500' /etc/ssh/sshd_config
sed -i '/Port 22/a Port 40000' /etc/ssh/sshd_config
sed -i '/Port 22/a Port 51443' /etc/ssh/sshd_config
sed -i '/Port 22/a Port 58080' /etc/ssh/sshd_config
sed -i '/Port 22/a Port 200' /etc/ssh/sshd_config
sed -i '/Port 22/a Port 22' /etc/ssh/sshd_config
/etc/init.d/ssh restart

echo "=== Install Dropbear ==="
mkdir -p /etc/funny
##end
#instal sslh
#!/bin/bash
# Install SSLH
apt -y install sslh
rm -f /etc/default/sslh

# Settings SSLH
cat> /etc/default/sslh << END
# Default options for sslh initscript
# sourced by /etc/init.d/sslh

# Disabled by default, to force yourself
# to read the configuration:
# - /usr/share/doc/sslh/README.Debian (quick start)
# - /usr/share/doc/sslh/README, at "Configuration" section
# - sslh(8) via "man sslh" for more configuration details.
# Once configuration ready, you *must* set RUN to yes here
# and try to start sslh (standalone mode only)

RUN=yes

# binary to use: forked (sslh) or single-thread (sslh-select) version
# systemd users: don't forget to modify /lib/systemd/system/sslh.service
DAEMON=/usr/sbin/sslh

DAEMON_OPTS="--user sslh --listen 0.0.0.0:8000 --ssh 127.0.0.1:111 --http 127.0.0.1:700 --pidfile /var/run/sslh/sslh.pid -n"

END

rm /usr/sbin/sslh
cd
wget https://raw.githubusercontent.com/Rerechan02/fn/main/sslh
cp sslh /usr/sbin/sslh
chmod +x /usr/sbin/sslh
# Restart Service SSLH
service sslh restart
systemctl restart sslh
systemctl enable sslh
##end

apt install dropbear
rm /etc/default/dropbear
rm /etc/issue.net
cat>  /etc/default/dropbear << END
# disabled because OpenSSH is installed
# change to NO_START=0 to enable Dropbear
NO_START=0
# the TCP port that Dropbear listens on
DROPBEAR_PORT=109
DROPBEAR_PORT=143
DROPBEAR_PORT=111
DROPBEAR_PORT=69
DROPBEAR_PORT=90
DROPBEAR_PORT=83
DROPBEAR_PORT=89
DROPBEAR_PORT=9090

# any additional arguments for Dropbear
#DROPBEAR_EXTRA_ARGS="-p 109 -p 69 "

# specify an optional banner file containing a message to be
# sent to clients before they connect, such as "/etc/issue.net"
DROPBEAR_BANNER="/etc/funny/banner.conf"

# RSA hostkey file (default: /etc/dropbear/dropbear_rsa_host_key)
#DROPBEAR_RSAKEY="/etc/dropbear/dropbear_rsa_host_key"

# DSS hostkey file (default: /etc/dropbear/dropbear_dss_host_key)
#DROPBEAR_DSSKEY="/etc/dropbear/dropbear_dss_host_key"

# ECDSA hostkey file (default: /etc/dropbear/dropbear_ecdsa_host_key)
#DROPBEAR_ECDSAKEY="/etc/dropbear/dropbear_ecdsa_host_key"

# Receive window size - this is a tradeoff between memory and
# network performance
DROPBEAR_RECEIVE_WINDOW=65536
END
echo "/bin/false" >> /etc/shells
echo "/usr/sbin/nologin" >> /etc/shells
/etc/init.d/dropbear restart
cat> /etc/funny/banner.conf << END
<br>
<font color="blue"><b>===============================</br></font><br>
<font color="red"><b>********  Funny VPN  ********</b></font><br>
<font color="blue"><b>===============================</br></font><br>
END
/etc/init.d/dropbear restart

cd
# install stunnel
apt install stunnel4 -y
cat > /etc/stunnel/stunnel.conf <<-END
cert = /etc/stunnel/stunnel.pem
client = no
socket = a:SO_REUSEADDR=1
socket = l:TCP_NODELAY=1
socket = r:TCP_NODELAY=1

[dropbear]
accept = 777
connect = 127.0.0.1:69

[dropbear]
accept = 8443
connect = 127.0.0.1:109

END

# make a certificate
openssl genrsa -out key.pem 2048
openssl req -new -x509 -key key.pem -out cert.pem -days 1095 \
-subj "/C=$country/ST=$state/L=$locality/O=$organization/OU=$organizationalunit/CN=$commonname/emailAddress=$email"
cat key.pem cert.pem >> /etc/stunnel/stunnel.pem

# konfigurasi stunnel
sed -i 's/ENABLED=0/ENABLED=1/g' /etc/default/stunnel4
/etc/init.d/stunnel4 restart

# install fail2ban
apt -y install fail2ban

# Instal DDOS Flate
if [ -d '/usr/local/ddos' ]; then
	echo; echo; echo "Please un-install the previous version first"
	exit 0
else
	mkdir /usr/local/ddos
fi
clear
echo; echo 'Installing DOS-Deflate 0.6'; echo
echo; echo -n 'Downloading source files...'
wget -q -O /usr/local/ddos/ddos.conf http://www.inetbase.com/scripts/ddos/ddos.conf
echo -n '.'
wget -q -O /usr/local/ddos/LICENSE http://www.inetbase.com/scripts/ddos/LICENSE
echo -n '.'
wget -q -O /usr/local/ddos/ignore.ip.list http://www.inetbase.com/scripts/ddos/ignore.ip.list
echo -n '.'
wget -q -O /usr/local/ddos/ddos.sh http://www.inetbase.com/scripts/ddos/ddos.sh
chmod 0755 /usr/local/ddos/ddos.sh
cp -s /usr/local/ddos/ddos.sh /usr/local/sbin/ddos
echo '...done'
echo; echo -n 'Creating cron to run script every minute.....(Default setting)'
/usr/local/ddos/ddos.sh --cron > /dev/null 2>&1
echo '.....done'
echo; echo 'Installation has completed.'
echo 'Config file is at /usr/local/ddos/ddos.conf'
echo 'Please send in your comments and/or suggestions to zaf@vsnl.com'

# banner /etc/issue.net
sleep 1
echo "Banner /etc/issue.net" >> /etc/ssh/sshd_config
sed -i 's@DROPBEAR_BANNER=""@DROPBEAR_BANNER="/etc/issue.net"@g' /etc/default/dropbear

# blockir torrent
iptables -A FORWARD -m string --string "get_peers" --algo bm -j DROP
iptables -A FORWARD -m string --string "announce_peer" --algo bm -j DROP
iptables -A FORWARD -m string --string "find_node" --algo bm -j DROP
iptables -A FORWARD -m string --algo bm --string "BitTorrent" -j DROP
iptables -A FORWARD -m string --algo bm --string "BitTorrent protocol" -j DROP
iptables -A FORWARD -m string --algo bm --string "peer_id=" -j DROP
iptables -A FORWARD -m string --algo bm --string ".torrent" -j DROP
iptables -A FORWARD -m string --algo bm --string "announce.php?passkey=" -j DROP
iptables -A FORWARD -m string --algo bm --string "torrent" -j DROP
iptables -A FORWARD -m string --algo bm --string "announce" -j DROP
iptables -A FORWARD -m string --algo bm --string "info_hash" -j DROP
iptables-save > /etc/iptables.up.rules
iptables-restore -t < /etc/iptables.up.rules
netfilter-persistent save
netfilter-persistent reload

wget https://raw.githubusercontent.com/Rerechan02/indo-ssh/main/badvpn/setup1.sh && chmod +x * && ./setup1.sh && rm -fr setup1.sh
# download script
cd /usr/bin
# menu
wget -O bmenu "https://raw.githubusercontent.com/Rerechan02/indo-ssh/main/menu/menu-bckp.sh"
wget -O nsmenu "https://raw.githubusercontent.com/Rerechan02/indo-ssh/main/menu/nsmenu.sh"
wget -O pubkey "https://raw.githubusercontent.com/Rerechan02/indo-ssh/main/menu/pubkey.sh"
wget -O dmenu "https://raw.githubusercontent.com/Rerechan02/indo-ssh/main/menu/dmenu.sh"
wget -O menu "https://raw.githubusercontent.com/Rerechan02/indo-ssh/main/menu/menu.sh"
wget -O xmenu "https://raw.githubusercontent.com/Rerechan02/indo-ssh/main/menu/xmenu.sh"
wget -O tmenu "https://raw.githubusercontent.com/Rerechan02/indo-ssh/main/menu/tmenu.sh"
wget -O funny "https://raw.githubusercontent.com/Rerechan02/indo-ssh/main/menu/menu.sh"
wget -O fn "https://raw.githubusercontent.com/Rerechan02/indo-ssh/main/menu/menu.sh"
wget -O rere "https://raw.githubusercontent.com/Rerechan02/indo-ssh/main/menu/menu.sh"
wget -O rere02 "https://raw.githubusercontent.com/Rerechan02/indo-ssh/main/menu/menu.sh"
wget -O Rere02 "https://raw.githubusercontent.com/Rerechan02/indo-ssh/main/menu/menu.sh"
wget -O m-bot "https://raw.githubusercontent.com/Rerechan02/indo-ssh/main/menu/m-bot.sh"
wget -O m-ip "https://raw.githubusercontent.com/Rerechan02/indo-ssh/main/menu/m-ip.sh"
wget -O menu-trial "https://raw.githubusercontent.com/Rerechan02/indo-ssh/main/menu/menu-trial.sh"
wget -O menu-vmess "https://raw.githubusercontent.com/Rerechan02/indo-ssh/main/menu/menu-vmess.sh"
wget -O menu-vless "https://raw.githubusercontent.com/Rerechan02/indo-ssh/main/menu/menu-vless.sh"
wget -O running "https://raw.githubusercontent.com/Rerechan02/indo-ssh/main/menu/running.sh"
wget -O clearcache "https://raw.githubusercontent.com/Rerechan02/indo-ssh/main/menu/clearcache.sh"
wget -O menu-trgo "https://raw.githubusercontent.com/Rerechan02/indo-ssh/main/menu/menu-trgo.sh"
wget -O menu-trojan "https://raw.githubusercontent.com/Rerechan02/indo-ssh/main/menu/menu-trojan.sh"
wget -O menu-ssh "https://raw.githubusercontent.com/Rerechan02/indo-ssh/main/menu/menu-ssh.sh"
wget -O usernew "https://raw.githubusercontent.com/Rerechan02/indo-ssh/main/ssh/usernew.sh"
wget -O trial "https://raw.githubusercontent.com/Rerechan02/indo-ssh/main/ssh/trial.sh"
wget -O renew "https://raw.githubusercontent.com/Rerechan02/indo-ssh/main/ssh/renew.sh"
wget -O hapus "https://raw.githubusercontent.com/Rerechan02/indo-ssh/main/ssh/hapus.sh"
wget -O cek "https://raw.githubusercontent.com/Rerechan02/indo-ssh/main/ssh/cek.sh"
wget -O member "https://raw.githubusercontent.com/Rerechan02/indo-ssh/main/ssh/member.sh"
wget -O delete "https://raw.githubusercontent.com/Rerechan02/indo-ssh/main/ssh/delete.sh"
wget -O autokill "https://raw.githubusercontent.com/Rerechan02/indo-ssh/main/ssh/autokill.sh"
wget -O ceklim "https://raw.githubusercontent.com/Rerechan02/indo-ssh/main/ssh/ceklim.sh"
wget -O tendang "https://raw.githubusercontent.com/Rerechan02/indo-ssh/main/ssh/tendang.sh"
wget -O menu-set "https://raw.githubusercontent.com/Rerechan02/indo-ssh/main/menu/menu-set.sh"
wget -O menu-domain "https://raw.githubusercontent.com/Rerechan02/indo-ssh/main/menu/menu-domain.sh"
wget -O add-host "https://raw.githubusercontent.com/Rerechan02/indo-ssh/main/ssh/add-host.sh"
wget -O port-change "https://raw.githubusercontent.com/Rerechan02/indo-ssh/main/port/port-change.sh"
wget -O certv2ray "https://raw.githubusercontent.com/Rerechan02/indo-ssh/main/xray/certv2ray.sh"
wget -O menu-webmin "https://raw.githubusercontent.com/Rerechan02/indo-ssh/main/menu/menu-webmin.sh"
wget -O speedtest "https://raw.githubusercontent.com/Rerechan02/indo-ssh/main/ssh/speedtest_cli.py"
wget -O about "https://raw.githubusercontent.com/Rerechan02/indo-ssh/main/menu/about.sh"
wget -O auto-reboot "https://raw.githubusercontent.com/Rerechan02/indo-ssh/main/menu/auto-reboot.sh"
wget -O restart "https://raw.githubusercontent.com/Rerechan02/indo-ssh/main/menu/restart.sh"
wget -O bw "https://raw.githubusercontent.com/Rerechan02/indo-ssh/main/menu/bw.sh"
wget -O port-ssl "https://raw.githubusercontent.com/Rerechan02/indo-ssh/main/port/port-ssl.sh"
wget -O port-ovpn "https://raw.githubusercontent.com/Rerechan02/indo-ssh/main/port/port-ovpn.sh"
wget -O xp "https://raw.githubusercontent.com/Rerechan02/indo-ssh/main/ssh/xp.sh"
wget -O acs-set "https://raw.githubusercontent.com/Rerechan02/indo-ssh/main/acs-set.sh"
wget -O sshws "https://raw.githubusercontent.com/Rerechan02/indo-ssh/main/ssh/sshws.sh"
wget -O status "https://raw.githubusercontent.com/Rerechan02/indo-ssh/main/status.sh"
wget -O menu-bckp "https://raw.githubusercontent.com/Rerechan02/indo-ssh/main/menu/menu-bckp.sh"
wget -O backup "https://raw.githubusercontent.com/Rerechan02/indo-ssh/main/backup/backup.sh"
wget -O restore "https://raw.githubusercontent.com/Rerechan02/indo-ssh/main/backup/restore.sh"
wget -O jam "https://raw.githubusercontent.com/Rerechan02/indo-ssh/main/jam.sh"
wget -O add-ws "https://raw.githubusercontent.com/Rerechan02/indo-ssh/main/xray/add-ws.sh"
wget -O trialvmess "https://raw.githubusercontent.com/Rerechan02/indo-ssh/main/xray/trialvmess.sh"
wget -O renew-ws "https://raw.githubusercontent.com/Rerechan02/indo-ssh/main/xray/renew-ws.sh"
wget -O del-ws "https://raw.githubusercontent.com/Rerechan02/indo-ssh/main/xray/del-ws.sh"
wget -O cek-ws "https://raw.githubusercontent.com/Rerechan02/indo-ssh/main/xray/cek-ws.sh"
wget -O add-vless "https://raw.githubusercontent.com/Rerechan02/indo-ssh/main/xray/add-vless.sh"
wget -O trialvless "https://raw.githubusercontent.com/Rerechan02/indo-ssh/main/xray/trialvless.sh"
wget -O renew-vless "https://raw.githubusercontent.com/Rerechan02/indo-ssh/main/xray/renew-vless.sh"
wget -O del-vless "https://raw.githubusercontent.com/Rerechan02/indo-ssh/main/xray/del-vless.sh"
wget -O cek-vless "https://raw.githubusercontent.com/Rerechan02/indo-ssh/main/xray/cek-vless.sh"
wget -O add-tr "https://raw.githubusercontent.com/Rerechan02/indo-ssh/main/xray/add-tr.sh"
wget -O trialtrojan "https://raw.githubusercontent.com/Rerechan02/indo-ssh/main/xray/trialtrojan.sh"
wget -O del-tr "https://raw.githubusercontent.com/Rerechan02/indo-ssh/main/xray/del-tr.sh"
wget -O renew-tr "https://raw.githubusercontent.com/Rerechan02/indo-ssh/main/xray/renew-tr.sh"
wget -O cek-tr "https://raw.githubusercontent.com/Rerechan02/indo-ssh/main/xray/cek-tr.sh"
wget -O addtrgo "https://raw.githubusercontent.com/Rerechan02/indo-ssh/main/xray/addtrgo.sh"
wget -O trialtrojango "https://raw.githubusercontent.com/Rerechan02/indo-ssh/main/xray/trialtrojango.sh"
wget -O deltrgo "https://raw.githubusercontent.com/Rerechan02/indo-ssh/main/xray/deltrgo.sh"
wget -O renewtrgo "https://raw.githubusercontent.com/Rerechan02/indo-ssh/main/xray/renewtrgo.sh"
wget -O cektrgo "https://raw.githubusercontent.com/Rerechan02/indo-ssh/main/xray/cektrgo.sh"
# shadowsocks
wget -O add-ssws "https://raw.githubusercontent.com/Rerechan02/indo-ssh/main/xray/add-ssws.sh" && chmod +x add-ssws
wget -O trialssws "https://raw.githubusercontent.com/Rerechan02/indo-ssh/main/xray/trialssws.sh" && chmod +x trialssws
wget -O del-ssws "https://raw.githubusercontent.com/Rerechan02/indo-ssh/main/xray/del-ssws.sh" && chmod +x del-ssws
wget -O renew-ssws "https://raw.githubusercontent.com/Rerechan02/indo-ssh/main/xray/renew-ssws.sh" && chmod +x renew-ssws
wget -O m-ssws "https://raw.githubusercontent.com/Rerechan02/indo-ssh/main/menu/m-ssws.sh"
chmod +x *
chmod +x menu
chmod +x m-bot
chmod +x m-ip
chmod +x menu-trial
chmod +x menu-vmess
chmod +x menu-vless
chmod +x running
chmod +x clearcache
chmod +x menu-trgo
chmod +x menu-trojan
chmod +x menu-ssh
chmod +x usernew
chmod +x trial
chmod +x renew
chmod +x hapus
chmod +x cek
chmod +x member
chmod +x delete
chmod +x autokill
chmod +x ceklim
chmod +x tendang
chmod +x menu-set
chmod +x menu-domain
chmod +x add-host
chmod +x port-change
chmod +x certv2ray
chmod +x menu-webmin
chmod +x speedtest
chmod +x about
chmod +x auto-reboot
chmod +x restart
chmod +x bw
chmod +x port-ssl
chmod +x port-ovpn
chmod +x xp
chmod +x acs-set
chmod +x sshws
chmod +x status
chmod +x menu-bckp
chmod +x backup
chmod +x restore
chmod +x jam
chmod +x add-ws
chmod +x trialvmess
chmod +x renew-ws
chmod +x del-ws
chmod +x cek-ws
chmod +x add-vless
chmod +x trialvless
chmod +x renew-vless
chmod +x del-vless
chmod +x cek-vless
chmod +x add-tr
chmod +x trialtrojan
chmod +x del-tr
chmod +x renew-tr
chmod +x cek-tr
chmod +x addtrgo
chmod +x trialtrojango
chmod +x deltrgo
chmod +x renewtrgo
chmod +x cektrgo
cd


cat > /etc/cron.d/re_otm <<-END
SHELL=/bin/sh
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
0 2 * * * root /sbin/reboot
END

cat > /etc/cron.d/xp_otm <<-END
SHELL=/bin/sh
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
0 0 * * * root /usr/bin/xp
END

cat > /home/re_otm <<-END
7
END

service cron restart >/dev/null 2>&1
service cron reload >/dev/null 2>&1

# remove unnecessary files
sleep 1
echo -e "[ ${green}INFO$NC ] Clearing trash"
apt autoclean -y >/dev/null 2>&1

if dpkg -s unscd >/dev/null 2>&1; then
apt -y remove --purge unscd >/dev/null 2>&1
fi

apt-get -y --purge remove samba* >/dev/null 2>&1
apt-get -y --purge remove apache2* >/dev/null 2>&1
apt-get -y --purge remove bind9* >/dev/null 2>&1
apt-get -y remove sendmail* >/dev/null 2>&1
apt autoremove -y >/dev/null 2>&1
# finishing
cd
chown -R www-data:www-data /home/vps/public_html
sleep 1
echo -e "$yell[SERVICE]$NC Restart All service SSH & OVPN"
/etc/init.d/nginx restart >/dev/null 2>&1
sleep 1
echo -e "[ ${green}ok${NC} ] Restarting nginx"
/etc/init.d/openvpn restart >/dev/null 2>&1
sleep 1
echo -e "[ ${green}ok${NC} ] Restarting cron "
/etc/init.d/ssh restart >/dev/null 2>&1
sleep 1
echo -e "[ ${green}ok${NC} ] Restarting ssh "
/etc/init.d/dropbear restart >/dev/null 2>&1
sleep 1
echo -e "[ ${green}ok${NC} ] Restarting dropbear "
/etc/init.d/fail2ban restart >/dev/null 2>&1
sleep 1
echo -e "[ ${green}ok${NC} ] Restarting fail2ban "
/etc/init.d/stunnel4 restart >/dev/null 2>&1
sleep 1
echo -e "[ ${green}ok${NC} ] Restarting stunnel4 "
/etc/init.d/vnstat restart >/dev/null 2>&1
sleep 1
echo -e "[ ${green}ok${NC} ] Restarting vnstat "
/etc/init.d/squid restart >/dev/null 2>&1

history -c
echo "unset HISTFILE" >> /etc/profile


rm -f /root/key.pem
rm -f /root/cert.pem
rm -f /root/ssh-vpn.sh
rm -f /root/bbr.sh

# finihsing
clear
