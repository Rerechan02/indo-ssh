#!/bin/bash
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
###########- COLOR CODE -##############
echo -e " [INFO] Downloading Update File"
sleep 2
cd /usr/bin
wget -O /usr/bin/ menu "https://raw.githubusercontent.com/Rerechan02/v/main/menu/menu.sh"
wget -O /usr/bin/ menu-trial "https://raw.githubusercontent.com/Rerechan02/v/main/menu/menu-trial.sh"
wget -O /usr/bin/ menu-vmess "https://raw.githubusercontent.com/Rerechan02/v/main/menu/menu-vmess.sh"
wget -O /usr/bin/ menu-vless "https://raw.githubusercontent.com/Rerechan02/v/main/menu/menu-vless.sh"
wget -O /usr/bin/ running "https://raw.githubusercontent.com/Rerechan02/v/main/menu/running.sh"
wget -O /usr/bin/ clearcache "https://raw.githubusercontent.com/Rerechan02/v/main/menu/clearcache.sh"
wget -O /usr/bin/ menu-trgo "https://raw.githubusercontent.com/Rerechan02/v/main/menu/menu-trgo.sh"
wget -O /usr/bin/ menu-trojan "https://raw.githubusercontent.com/Rerechan02/v/main/menu/menu-trojan.sh"
wget -O /usr/bin/ menu-ssh "https://raw.githubusercontent.com/Rerechan02/v/main/menu/menu-ssh.sh"
wget -O /usr/bin/ usernew "https://raw.githubusercontent.com/Rerechan02/v/main/ssh/usernew.sh"
wget -O /usr/bin/ trial "https://raw.githubusercontent.com/Rerechan02/v/main/ssh/trial.sh"
wget -O /usr/bin/ renew "https://raw.githubusercontent.com/Rerechan02/v/main/ssh/renew.sh"
wget -O /usr/bin/ hapus "https://raw.githubusercontent.com/Rerechan02/v/main/ssh/hapus.sh"
wget -O /usr/bin/ cek "https://raw.githubusercontent.com/Rerechan02/v/main/ssh/cek.sh"
wget -O /usr/bin/ member "https://raw.githubusercontent.com/Rerechan02/v/main/ssh/member.sh"
wget -O /usr/bin/ delete "https://raw.githubusercontent.com/Rerechan02/v/main/ssh/delete.sh"
wget -O /usr/bin/ autokill "https://raw.githubusercontent.com/Rerechan02/v/main/ssh/autokill.sh"
wget -O /usr/bin/ ceklim "https://raw.githubusercontent.com/Rerechan02/v/main/ssh/ceklim.sh"
wget -O /usr/bin/ tendang "https://raw.githubusercontent.com/Rerechan02/v/main/ssh/tendang.sh"
wget -O /usr/bin/ menu-set "https://raw.githubusercontent.com/Rerechan02/v/main/menu/menu-set.sh"
wget -O /usr/bin/ menu-domain "https://raw.githubusercontent.com/Rerechan02/v/main/menu/menu-domain.sh"
wget -O /usr/bin/ add-host "https://raw.githubusercontent.com/Rerechan02/v/main/ssh/add-host.sh"
wget -O /usr/bin/ port-change "https://raw.githubusercontent.com/Rerechan02/v/main/port/port-change.sh"
wget -O /usr/bin/ certv2ray "https://raw.githubusercontent.com/Rerechan02/v/main/xray/certv2ray.sh"
wget -O /usr/bin/ menu-webmin "https://raw.githubusercontent.com/Rerechan02/v/main/menu/menu-webmin.sh"
wget -O /usr/bin/ speedtest "https://raw.githubusercontent.com/Rerechan02/v/main/ssh/speedtest_cli.py"
wget -O /usr/bin/ about "https://raw.githubusercontent.com/Rerechan02/v/main/menu/about.sh"
wget -O /usr/bin/ auto-reboot "https://raw.githubusercontent.com/Rerechan02/v/main/menu/auto-reboot.sh"
wget -O /usr/bin/ restart "https://raw.githubusercontent.com/Rerechan02/v/main/menu/restart.sh"
wget -O /usr/bin/ bw "https://raw.githubusercontent.com/Rerechan02/v/main/menu/bw.sh"
wget -O /usr/bin/ port-ssl "https://raw.githubusercontent.com/Rerechan02/v/main/port/port-ssl.sh"
wget -O /usr/bin/ port-ovpn "https://raw.githubusercontent.com/Rerechan02/v/main/port/port-ovpn.sh"
wget -O /usr/bin/ xp "https://raw.githubusercontent.com/Rerechan02/v/main/ssh/xp.sh"
wget -O /usr/bin/ acs-set "https://raw.githubusercontent.com/Rerechan02/v/main/acs-set.sh"
wget -O /usr/bin/ sshws "https://raw.githubusercontent.com/Rerechan02/v/main/ssh/sshws.sh"
wget -O /usr/bin/ status "https://raw.githubusercontent.com/Rerechan02/v/main/status.sh"
wget -O /usr/bin/ menu-bckp "https://raw.githubusercontent.com/Rerechan02/v/main/menu/menu-bckp.sh"
wget -O /usr/bin/ backup "https://raw.githubusercontent.com/Rerechan02/v/main/backup/backup.sh"
wget -O /usr/bin/ restore "https://raw.githubusercontent.com/Rerechan02/v/main/backup/restore.sh"
wget -O /usr/bin/ jam "https://raw.githubusercontent.com/Rerechan02/v/main/jam.sh"
wget -O /usr/bin/ add-ws "https://raw.githubusercontent.com/Rerechan02/v/main/xray/add-ws.sh"
wget -O /usr/bin/ trialvmess "https://raw.githubusercontent.com/Rerechan02/v/main/xray/trialvmess.sh"
wget -O /usr/bin/ renew-ws "https://raw.githubusercontent.com/Rerechan02/v/main/xray/renew-ws.sh"
wget -O /usr/bin/ del-ws "https://raw.githubusercontent.com/Rerechan02/v/main/xray/del-ws.sh"
wget -O /usr/bin/ cek-ws "https://raw.githubusercontent.com/Rerechan02/v/main/xray/cek-ws.sh"
wget -O /usr/bin/ add-vless "https://raw.githubusercontent.com/Rerechan02/v/main/xray/add-vless.sh"
wget -O /usr/bin/ trialvless "https://raw.githubusercontent.com/Rerechan02/v/main/xray/trialvless.sh"
wget -O /usr/bin/ renew-vless "https://raw.githubusercontent.com/Rerechan02/v/main/xray/renew-vless.sh"
wget -O /usr/bin/ del-vless "https://raw.githubusercontent.com/Rerechan02/v/main/xray/del-vless.sh"
wget -O /usr/bin/ cek-vless "https://raw.githubusercontent.com/Rerechan02/v/main/xray/cek-vless.sh"
wget -O /usr/bin/ add-tr "https://raw.githubusercontent.com/Rerechan02/v/main/xray/add-tr.sh"
wget -O /usr/bin/ trialtrojan "https://raw.githubusercontent.com/Rerechan02/v/main/xray/trialtrojan.sh"
wget -O /usr/bin/ del-tr "https://raw.githubusercontent.com/Rerechan02/v/main/xray/del-tr.sh"
wget -O /usr/bin/ renew-tr "https://raw.githubusercontent.com/Rerechan02/v/main/xray/renew-tr.sh"
wget -O /usr/bin/ cek-tr "https://raw.githubusercontent.com/Rerechan02/v/main/xray/cek-tr.sh"
wget -O /usr/bin/ addtrgo "https://raw.githubusercontent.com/Rerechan02/v/main/xray/addtrgo.sh"
wget -O /usr/bin/ trialtrojango "https://raw.githubusercontent.com/Rerechan02/v/main/xray/trialtrojango.sh"
wget -O /usr/bin/ deltrgo "https://raw.githubusercontent.com/Rerechan02/v/main/xray/deltrgo.sh"
wget -O /usr/bin/ renewtrgo "https://raw.githubusercontent.com/Rerechan02/v/main/xray/renewtrgo.sh"
wget -O /usr/bin/ cektrgo "https://raw.githubusercontent.com/Rerechan02/v/main/xray/cektrgo.sh"


chmod +x menu
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

echo -e " [INFO] Update Successfully"
sleep 2
exit
