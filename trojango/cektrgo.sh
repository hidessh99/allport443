#!/bin/bash
# My Telegram : https://t.me/zerossl
# ==========================================
# Color
RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHT='\033[0;37m'
# ==========================================
# Getting
MYIP=$(wget -qO- ipinfo.io/ip);
clear
echo -n > /tmp/other.txt
data=( `cat /var/log/trojan-go.log | grep -w 'authenticated as' | awk '{print $7}' | sort | uniq`);
echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\033[1;46m 🔰 CEK USER TROJAN GO RELOGIN  🔰  \e[m"       
echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
for akun in "${data[@]}"
do
data2=( `lsof -n | grep -i ESTABLISHED | grep trojan-go | awk '{print $9}' | cut -d':' -f2 | grep -w 2096 | cut -d- -f2 | grep -v '>127.0.0.1' | sort | uniq | cut -d'>' -f2`);
echo -n > /tmp/iptrojan-go.txt
for ip in "${data2[@]}"
do
jum=$(cat /var/log/trojan-go.log | grep -w $akun | awk '{print $4}' | cut -d: -f1 | grep -w $ip | sort | uniq)
if [[ -z "$jum" ]]; then
echo > /dev/null
else
echo "$jum" > /tmp/iptrojan-go.txt
fi
done
jum2=$(cat /tmp/iptrojan-go.txt | nl)
lastlogin=$(cat /var/log/trojan-go.log | grep -w "$akun" | tail -n 500 | cut -d " " -f1 | tail -1)
echo -e "${RED}TEOJAN-GO"
echo -e "user :${LIGHT} ${akun} ${NC}
${LIGHT}JAM LOGIN ${NC}: ${lastlogin} wib";
echo -e "$jum2";
echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\033[1;46m    🔰SOLO THE SPIRIT OF JAVA🔰    \e[m"   
echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
fi
rm -rf /tmp/iptrojan-go.txt
done
rm -rf /tmp/other.txt

echo ""
read -n 1 -s -r -p "Ketik Bebas Untuk Ke Menu Utama"
menu
