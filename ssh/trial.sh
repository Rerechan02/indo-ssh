#!/bin/bash
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
#########################



sldomain=`cat /etc/xray/dns`
slkey=`cat /etc/slowdns/server.pub`
domen=`cat /etc/xray/domain`
Login=trial`</dev/urandom tr -dc X-Z0-9 | head -c4`
hari="1"
Pass=1
echo Create Akun: $Login
echo Setting Password: $Pass
clear
useradd -e `date -d "$masaaktif days" +"%Y-%m-%d"` -s /bin/false -M $Login
exp="$(chage -l $Login | grep "Account expires" | awk -F": " '{print $2}')"
echo -e "$Pass\n$Pass\n"|passwd $Login &> /dev/null
clear
echo -e "══════════════════════════"                 
echo -e "    <=  SSH ACCOUNT =>"       
echo -e "══════════════════════════"                 
echo -e ""
echo -e "Username     : $Login"
echo -e "Password     : $Pass"        
echo -e "CITY         : $(cat /root/.mycity)"
echo -e "ISP          : $(cat /root/.myisp)"
echo -e "Host/IP      : $(cat /etc/xray/domain)"
echo -e "NSDOMAIN     : $(cat /etc/xray/dns)"
echo -e "PUBKEY       : $(cat /etc/slowdns/server.pub)"
echo -e "Slowdns      : 53, 5300"
echo -e "Port tls/ssl : 8443, 777, 443"
echo -e "Port non tls : 80, 8080, 8880"
echo -e "Udp Custom   : 7100-7900, 500-6000"
echo -e "BadVpn       : 7300"      
echo -e ""  
echo -e "══════════════════════════"                 
echo -e "Payload Ws   => GET wss://$(cat /etc/xray/domain)/ HTTP/1.1[crlf]Host: $(cat /etc/xray/domain)[crlf]Upgrade: websocket[crlf][crlf]"
echo -e "══════════════════════════"                 
echo -e "     Expired => $exp"
echo -e "══════════════════════════"                
fi
echo ""
read -n 1 -s -r -p "Press any key to back on menu"
menu
