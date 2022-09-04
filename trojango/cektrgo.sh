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
NC='\e[0m'
green() { echo -e "\\033[32;1m${*}\\033[0m"; }
red() { echo -e "\\033[31;1m${*}\\033[0m"; }
# // Exporting Language to UTF-8

export LANG='en_US.UTF-8'
export LANGUAGE='en_US.UTF-8'


# // Export Color & Information
export RED='\033[0;31m'
export GREEN='\033[0;32m'
export YELLOW='\033[0;33m'
export BLUE='\033[0;34m'
export PURPLE='\033[0;35m'
export CYAN='\033[0;36m'
export LIGHT='\033[0;37m'
export NC='\033[0m'

# // Export Banner Status Information
export EROR="[${RED} EROR ${NC}]"
export INFO="[${YELLOW} INFO ${NC}]"
export OKEY="[${GREEN} OKEY ${NC}]"
export PENDING="[${YELLOW} PENDING ${NC}]"
export SEND="[${YELLOW} SEND ${NC}]"
export RECEIVE="[${YELLOW} RECEIVE ${NC}]"

# // Export Align
export BOLD="\e[1m"
export WARNING="${RED}\e[5m"
export UNDERLINE="\e[4m"

export Server_Port="443"
export Server_IP="underfined"
export Script_Mode="Stable"
export Auther=".wisnu"
# ==========================================
# Getting
MYIP=$(wget -qO- ipinfo.io/ip);
clear
echo -n > /tmp/other.txt
data=( `cat /etc/xray/xtrojan.json | grep '^###' | cut -d ' ' -f 2`);
data=( `cat /etc/xray/xss.json | grep '^###' | cut -d ' ' -f 2`);
data=( `cat /etc/xray/xvmess.json | grep '^###' | cut -d ' ' -f 2`);
data=( `cat /etc/xray/xvless.json | grep '^###' | cut -d ' ' -f 2`);
data=( `cat /etc/xray/config.json | grep '^###' | cut -d ' ' -f 2`);
data=( `cat /etc/trojan-go/akun.conf | grep '^###' | cut -d ' ' -f2`);
echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\033[1;46m 🔰 CEK USER SENYAP TAPI GANAS 🔰  \e[m"       
echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
for akun in "${data[@]}"
do
if [[ -z "$akun" ]]; then
akun="tidakada"
fi
echo -n > /tmp/ipxray.txt
data=( `cat /etc/trojan-go/akun.conf | grep '^###' | cut -d ' ' -f2`);
for akun in "${data[@]}"
do
jum=$(cat /var/log/trojan-go/trojan-go.log | grep -w "$akun" | tail -n 500 | cut -d " " -f3 | sed 's/tcp://g' | cut -d ":" -f 1 | grep -w "$ip" | sort | uniq)
if [[ "$jum" = "$ip" ]]; then
echo "$jum" >> /tmp/iptrojan-go.txt
else
echo "$ip" >> /tmp/other.txt
fi
jum2=$(cat /tmp/iptrojan-go.txt)
sed -i "/$jum2/d" /tmp/other.txt > /dev/null 2>&1
done
jum=$(cat /tmp/iptrojan-go.txt)
if [[ -z "$jum" ]]; then
echo > /dev/null
else
jum2=$(cat /tmp/iptrojan-go.txt | nl)
lastlogin=$(cat /var/log/trojan-go/trojan-go.log | grep -w "$akun" | tail -n 500 | cut -d " " -f2 | tail -1)
echo -e "${RED}TROJAN GO"
echo -e "USERNAME :${LIGHT} ${akun} ${NC}
${LIGHT}JAM LOGIN ${NC}: ${lastlogin} wib";
echo -e "$jum2";
echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\033[1;46m    🔰SOLO THE SPIRIT OF JAVA🔰    \e[m"   
echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
fi
rm -rf /tmp/iptrojan-go.txt
done
rm -rf /tmp/other.txt
echo -e""
read -n 1 -s -r -p "Tekan Bebas Untuk Ke Menu"
trojanmenu
