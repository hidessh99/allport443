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
NUMBER_OF_CLIENTS=$(grep -c -E "^### " "/usr/local/shadowsocksr/akun.conf")
	if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
        echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
        echo -e "\033[1;46m  🔰 Renew Akun SSR 🔰   \E[0m"
        echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
        echo ""
        echo "You have no existing clients!"
        echo ""
        echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
        echo -e "\033[1;46m🔰LUXURY EDITION ZEROSSL🔰\e[m"   
        echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
        echo ""
        read -n 1 -s -r -p "Tekan Bebas Untuk Ke Menu"            
        ssmenu
	fi

        echo -e "\033[0;31m━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
        echo -e "\033[1;46m  🔰 Renew Akun SSR 🔰   \E[0m"
        echo -e "\033[0;31m━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
        echo ""
	grep -E "^### " "/usr/local/shadowsocksr/akun.conf" | cut -d ' ' -f 2-3 | nl -s ') '
	echo -e "     0) Cancel"
	echo ""
        echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
        echo -e "\033[1;46m🔰LUXURY EDITION ZEROSSL🔰\e[m"   
        echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
	until [[ ${CLIENT_NUMBER} -ge 1 && ${CLIENT_NUMBER} -le ${NUMBER_OF_CLIENTS} ]]; do
		if [[ ${CLIENT_NUMBER} == '1' ]]; then
			read -rp "Select one client [1]: " CLIENT_NUMBER
		else
			read -rp "Select one client [1-${NUMBER_OF_CLIENTS}]: " CLIENT_NUMBER
		fi
	done
read -p "Expired (Days): " masaaktif
user=$(grep -E "^### " "/usr/local/shadowsocksr/akun.conf" | cut -d ' ' -f 2 | sed -n "${CLIENT_NUMBER}"p)
exp=$(grep -E "^### " "/usr/local/shadowsocksr/akun.conf" | cut -d ' ' -f 3 | sed -n "${CLIENT_NUMBER}"p)
now=$(date +%Y-%m-%d)
d1=$(date -d "$exp" +%s)
d2=$(date -d "$now" +%s)
exp2=$(( (d1 - d2) / 86400 ))
exp3=$(($exp2 + $masaaktif))
exp4=`date -d "$exp3 days" +"%Y-%m-%d"`
tgl=$(echo "$exp4" | cut -d- -f3)
bln=$(echo "$exp4" | cut -d- -f2)
sed -i "s/### $user $exp/### $user $exp4/g" /usr/local/shadowsocksr/akun.conf
clear
echo ""
echo -e "\033[0;31m━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo " Shadowsocks-R Account Has Been Successfully Renewed"
echo -e "\033[0;31m━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo ""
echo " Client Name : $user"
echo " Expired On  : $exp4"
echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\033[1;46m🔰LUXURY EDITION ZEROSSL🔰\e[m"   
echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo ""
read -n 1 -s -r -p "Tekan Bebas Untuk Ke Menu"            
ssmenu
