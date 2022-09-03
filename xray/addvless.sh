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
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
date=`date +"%Y-%m-%d" -d "$dateFromServer"`
#MYIP=$(wget -qO- ipinfo.io/ip);
MYIP=$(wget -qO- https://ipv4.icanhazip.com);
MYIP6=$(wget -qO- https://ipv6.icanhazip.com);
clear
domain=$(cat /etc/xray/domain)

vltls="$(cat ~/log-install.txt | grep -w "VLESS WS TLS" | cut -d: -f2|sed 's/ //g')"
vlnontls="$(cat ~/log-install.txt | grep -w "VLESS WS NON TLS" | cut -d: -f2|sed 's/ //g')"
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${CLIENT_EXISTS} == '0' ]]; do
		read -rp "Username : " -e user
		CLIENT_EXISTS=$(grep -w $user /etc/xray/config.json | wc -l)

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
		CLIENT_EXISTS=$(grep -w $user /etc/xray/xvmess.json | wc -l)

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
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${CLIENT_EXISTS} == '0' ]]; do
		read -rp "Username : " -e user
		CLIENT_EXISTS=$(grep -w $user /etc/xray/xss.json | wc -l)

		if [[ ${CLIENT_EXISTS} == '1' ]]; then
			echo ""
			echo -e "Username ${RED}${user}${NC} Already On VPS Please Choose Another"
			exit 1
		fi
	done
#uuid=$(openssl rand -base64 16)
uuid=$(openssl rand -hex 7)
read -p "Expired (Days) : " masaaktif
#read -p "Expired (Seconds) : " masaaktif
hariini=`date -d "0 days" +"%Y-%m-%d"`
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
#exp2=`date -d "$masaaktif seconds" +"%Y-%m-%d"`
sed -i '/#vless-tls$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","email": "'""$user""'"' /etc/xray/xvmess.json
sed -i '/#vless-tls$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","email": "'""$user""'"' /etc/xray/xss.json
sed -i '/#vless-tls$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","email": "'""$user""'"' /etc/xray/xvless.json
sed -i '/#vless-tls$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","email": "'""$user""'"' /etc/xray/xtrojan.json
sed -i '/#vless-nontls$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","email": "'""$user""'"' /etc/xray/config.json
vlesstls="vless://${uuid}@${domain}:$vltls?host=${domain}&sni=${domain}&type=ws&security=tls&path=/WISNU&encryption=none#%F0%9F%94%B0VLESS+WS+TLS+${user}"
vlessnontls="vless://${uuid}@${domain}:$vlnontls?host=${domain}&security=none&type=ws&path=/WISNU&encryption=none#%F0%9F%94%B0VLESS+WS+NONTLS+${user}"
systemctl restart xray.service
systemctl restart xvless
systemctl restart xvmess
systemctl restart xtrojan
systemctl restart xss
#systemctl restart nginx
service cron restart
clear
echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\033[1;46m 🔰 AKUN VLESS WEBSOCKET 🔰\e[m"   
echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "✨ Nama ➡️ ${user}"
echo -e "✨ IP ➡️ ${MYIP}"
echo -e "✨ Host ➡️ ${domain}"
echo -e "✨ Port TLS ➡️ $vltls"
echo -e "✨ Port No TLS ➡️ $vlnontls"
echo -e "✨ Protokol ➡️ WS"
echo -e "✨ Path ➡️ /WISNU"
echo -e "✨ User ID ➡️ ${uuid}"
echo -e "✨ Dibuat ➡️ $hariini"
echo -e "✨ Kadaluarsa ➡️ $exp"
echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "✨ WS TLS ➡️  ${vlesstls}"
echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "✨ WS NONTLS ➡️  ${vlessnontls}"
echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\033[1;46m 🔰LUXURY EDITION ZEROSSL🔰\e[m"   
echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo ""
read -n 1 -s -r -p "Ketik Bebas Untuk Ke Menu Utama"
menu
