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
domain=$(cat /etc/xray/domain)

vlgrpc="$(cat ~/log-install.txt | grep -w "VLESS GRPC TLS" | cut -d: -f2|sed 's/ //g')"
#vlgrpcnon="$(cat ~/log-install.txt | grep -w "VLESS GRPC NON TLS" | cut -d: -f2|sed 's/ //g')"
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${CLIENT_EXISTS} == '0' ]]; do
		read -rp "Username : " -e user
		CLIENT_EXISTS=$(grep -w $user /etc/xray/xvless.json | wc -l)

		if [[ ${CLIENT_EXISTS} == '1' ]]; then
			echo ""
			echo -e "Username ${RED}${user}${NC} Already On VPS Please Choose Another"
			exit 1
		fi
	done
vlgrpcnon="$(cat ~/log-install.txt | grep -w "VLESS GRPC NON TLS" | cut -d: -f2|sed 's/ //g')"
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
		CLIENT_EXISTS=$(grep -w $user /etc/xray/config.json | wc -l)

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
#uuid=$(openssl rand -base64 16)
uuid=$(openssl rand -hex 7)
read -p "Expired (Days) : " masaaktif
hariini=`date -d "0 days" +"%Y-%m-%d"`
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
sed -i '/#vless-grpc-tls$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","email": "'""$user""'"' /etc/xray/xvless.json
sed -i '/#vless-grpc-tls$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","email": "'""$user""'"' /etc/xray/xvmess.json
sed -i '/#vless-grpc-tls$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","email": "'""$user""'"' /etc/xray/xtrojan.json
sed -i '/#vless-grpc-nontls$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","email": "'""$user""'"' /etc/xray/config.json
vlessgrpc1="vless://${uuid}@${domain}:$vlgrpc?serviceName=wisnugrpc&sni=${domain}&mode=multi&type=grpc&security=tls&encryption=none#%F0%9F%94%B0VLESS+GRPC+TLS+${user}"
vlessgrpc2="vless://${uuid}@${domain}:$vlgrpcnon?serviceName=wisnugrpc&sni=${domain}&mode=multi&type=grpc&security=none&encryption=none#%F0%9F%94%B0VLESS+GRPC+NONTLS+${user}"
systemctl restart xvless.service
systemctl restart xray.service
systemctl restart xvmess
systemctl restart xtrojan
systemctl restart nginx
service cron restart
clear
echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\033[1;46m  🔰 AKUN VLESS GRPC 🔰   \e[m"   
echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "Nama  :${user}"
echo -e "IP/Host  :${MYIP}"
echo -e "Address  :${domain}"
echo -e "Port TLS  :$vlgrpc"
#echo -e "Port NON TLS  :$vlgrpcnon"
echo -e "Protokol  :GRPC"
echo -e "ServiceName  :wisnugrpc"
echo -e "UserID  :${uuid}"
echo -e "Dibuat  :$hariini"
echo -e "Kadaluarsa  :$exp"
echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "VLESS GRPC TLS: ${vlessgrpc1}"
echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
#echo -e "VLESS GRPC NONTLS: ${vlessgrpc2}"
#echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\033[1;46m🔰LUXURY EDITION ZEROSSL🔰\e[m"   
echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""
