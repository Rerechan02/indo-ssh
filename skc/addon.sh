#!/bin/bash
cd /root
curl -L https://indo-ssh.com/backup.sh >> backup.sh
cp backup.sh /usr/bin/backup
chmod +x /usr/bin/backup
#echo "0 0,6,12,18 * * * root backup" >> /etc/crontab
systemctl restart cron
service cron restart
rm -rf addon.sh
echo "Sukses install add-on"
