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
#MYIP=$(wget -qO- ipinfo.io/ip);
MYIP=$(wget -qO- https://ipv4.icanhazip.com);
MYIP6=$(wget -qO- https://ipv6.icanhazip.com);
clear
domain=$(cat /etc/xray/domain)

vlxtls="$(cat ~/log-install.txt | grep -w "VLESS XTLS" | cut -d: -f2|sed 's/ //g')"
#nontls="$(cat ~/log-install.txt | grep -w "VLESS NON TLS" | cut -d: -f2|sed 's/ //g')"
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${CLIENT_EXISTS} == '0' ]]; do
		read -rp "Username : " -e user
		CLIENT_EXISTS=$(grep -w $user /etc/xray/xvmess.json | wc -l)

		if [[ ${CLIENT_EXISTS} == '1' ]]; then
			echo ""
			echo -e "Username ${RED}${user}${NC} Already On VPS Please Choose Another"
			exit 1
		fi
	done
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${CLIENT_EXISTS} == '0' ]]; do
		read -rp "Username : " -e user
		CLIENT_EXISTS=$(grep -w $user /etc/xray/xss.json | wc -l)

		if [[ ${CLIENT_EXISTS} == '1' ]]; then
			echo ""
			echo -e "Username ${RED}${user}${NC} Already On VPS Please Choose Another"
			exit 1
		fi
	done
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${CLIENT_EXISTS} == '0' ]]; do
		read -rp "Username : " -e user
		CLIENT_EXISTS=$(grep -w $user /etc/xray/xvless.json | wc -l)

		if [[ ${CLIENT_EXISTS} == '1' ]]; then
			echo ""
			echo -e "Username ${RED}${user}${NC} Already On VPS Please Choose Another"
			exit 1
		fi
	done
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${CLIENT_EXISTS} == '0' ]]; do
		read -rp "Username : " -e user
		CLIENT_EXISTS=$(grep -w $user /etc/xray/xtrojan.json | wc -l)

		if [[ ${CLIENT_EXISTS} == '1' ]]; then
			echo ""
			echo -e "Username ${RED}${user}${NC} Already On VPS Please Choose Another"
			exit 1
		fi
	done
uuid=$(cat /proc/sys/kernel/random/uuid)
read -p "Expired (Days) : " masaaktif
hariini=`date -d "0 days" +"%Y-%m-%d"`
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
sed -i '/#vless-xtls$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","flow": "'""xtls-rprx-direct""'", "email": "'""$user""'"' /etc/xray/xvmess.json
sed -i '/#vless-xtls$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","flow": "'""xtls-rprx-direct""'", "email": "'""$user""'"' /etc/xray/xtrojan.json
sed -i '/#vless-xtls$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","flow": "'""xtls-rprx-direct""'", "email": "'""$user""'"' /etc/xray/xvless.json
sed -i '/#vless-xtls$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","flow": "'""xtls-rprx-direct""'", "email": "'""$user""'"' /etc/xray/config.json
sed -i '/#vless-xtls$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","flow": "'""xtls-rprx-direct""'", "email": "'""$user""'"' /etc/xray/xss.json
vlessxtls="vless://${user}@${domain}:$vlxtls?type=tcp&security=xtls&headerType=none&flow=xtls-rprx-splice-udp443&encryption=none#%F0%9F%94%B0VLESS+XTLS+${user}"
vlessgfw="vless://${uuid}@${domain}:$vlxtls?security=tls&type=tcp&headerType=none&encryption=none#%F0%9F%94%B0VLESS+GFW+TLS+${user}"
systemctl restart xray.service
systemctl restart xvless.service
systemctl restart xvmess
systemctl restart xtrojan
service cron restart
clear
echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\033[1;46m🔰 AKUN VLESS XTLS GFW 🔰 \e[m"   
echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "Nama  :${user}"
echo -e "IP/Host  :${MYIP}"
echo -e "Alamat  :${domain}"
echo -e "Port  :${vlxtls}"
echo -e "Network  :tcp"
echo -e "Security  :xtls"
echo -e "Flow   :only origin's type not supported"
echo -e "UserID  :${uuid}"
echo -e "Dibuat  :$hariini"
echo -e "Kadaluarsa  :$exp"
echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "VLESS XTLS: ${vlessxtls}"
echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "VLESS GFW: ${vlessgfw}"
echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\033[1;46m🔰LUXURY EDITION ZEROSSL🔰\e[m"   
echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
