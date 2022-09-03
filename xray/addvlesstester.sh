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
MYIP=$(wget -qO- https://ipv4.icanhazip.com);
MYIP6=$(wget -qO- https://ipv6.icanhazip.com);
clear
domain=$(cat /etc/xray/domain)
vlquic="$(cat ~/log-install.txt | grep -w "VLESS QUIC TLS" | cut -d: -f2|sed 's/ //g')"
vlgrpc="$(cat ~/log-install.txt | grep -w "VLESS GRPC TLS" | cut -d: -f2|sed 's/ //g')"
vlgrpcnon="$(cat ~/log-install.txt | grep -w "VLESS GRPC NON TLS" | cut -d: -f2|sed 's/ //g')"
vlxtls="$(cat ~/log-install.txt | grep -w "VLESS XTLS" | cut -d: -f2|sed 's/ //g')"
vlnontls="$(cat ~/log-install.txt | grep -w "VLESS WS NON TLS" | cut -d: -f2|sed 's/ //g')"
vltls="$(cat ~/log-install.txt | grep -w "VLESS WS TLS" | cut -d: -f2|sed 's/ //g')"
vlhdua="$(cat ~/log-install.txt | grep -w "VLESS H2C TLS" | cut -d: -f2|sed 's/ //g')"
vlhduanon="$(cat ~/log-install.txt | grep -w "VLESS H2C NON TLS" | cut -d: -f2|sed 's/ //g')"
vlhttp="$(cat ~/log-install.txt | grep -w "VLESS HTTP TLS" | cut -d: -f2|sed 's/ //g')"
vlhttpnon="$(cat ~/log-install.txt | grep -w "VLESS HTTP NON TLS" | cut -d: -f2|sed 's/ //g')"
vlkcp="$(cat ~/log-install.txt | grep -w "VLESS KCP TLS" | cut -d: -f2|sed 's/ //g')"
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
#uuid=$(cat /proc/sys/kernel/random/uuid)
#uuid=$(openssl rand -base64 16)
uuid=$(openssl rand -hex 7)
read -p "Expired (Days) : " masaaktif
#read -p "Expired (Seconds) : " masaaktif
hariini=`date -d "0 days" +"%Y-%m-%d"`
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
#exp2=`date -d "$masaaktif seconds" +"%Y-%m-%d"`
sed -i '/#vless-grpc-tls$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","email": "'""$user""'"' /etc/xray/xvless.json
sed -i '/#vless-grpc-tls$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","email": "'""$user""'"' /etc/xray/xvmess.json
sed -i '/#vless-grpc-nontls$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","email": "'""$user""'"' /etc/xray/config.json
sed -i '/#vless-xtls$/a\#&# '"$user $exp"'\
},{"id": "'""$uuid""'","flow": "'""xtls-rprx-direct""'", "email": "'""$user""'"' /etc/xray/xvmess.json
sed -i '/#vless-xtls$/a\#&# '"$user $exp"'\
},{"id": "'""$uuid""'","flow": "'""xtls-rprx-direct""'", "email": "'""$user""'"' /etc/xray/xvless.json
sed -i '/#vless-hdua$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","email": "'""$user""'"' /etc/xray/xvmess.json
sed -i '/#vless-hdua$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","email": "'""$user""'"' /etc/xray/xvless.json
sed -i '/#vless-hdua$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","email": "'""$user""'"' /etc/xray/xtrojan.json
sed -i '/#vless-quic$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","email": "'""$user""'"' /etc/xray/xtrojan.json
sed -i '/#vless-quic$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","email": "'""$user""'"' /etc/xray/xvmess.json
sed -i '/#vless-quic$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","email": "'""$user""'"' /etc/xray/config.json
sed -i '/#vless-quic$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","email": "'""$user""'"' /etc/xray/xvless.json
sed -i '/#vless-tls$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","email": "'""$user""'"' /etc/xray/xvmess.json
sed -i '/#vless-tls$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","email": "'""$user""'"' /etc/xray/xvless.json
sed -i '/#vless-tls$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","email": "'""$user""'"' /etc/xray/xtrojan.json
sed -i '/#vless-nontls$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","email": "'""$user""'"' /etc/xray/config.json
sed -i '/#vless-http-tls$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","email": "'""$user""'"' /etc/xray/xvmess.json
sed -i '/#vless-http-tls$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","email": "'""$user""'"' /etc/xray/xtrojan.json
sed -i '/#vless-http-tls$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","email": "'""$user""'"' /etc/xray/config.json
sed -i '/#vless-http-tls$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","email": "'""$user""'"' /etc/xray/xvless.json
sed -i '/#vless-http-nontls$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","email": "'""$user""'"' /etc/xray/xtrojan.json
sed -i '/#vless-kcp$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","email": "'""$user""'"' /etc/xray/xvmess.json
sed -i '/#vless-kcp$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","email": "'""$user""'"' /etc/xray/xvless.json
sed -i '/#vless-kcp$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","email": "'""$user""'"' /etc/xray/xtrojan.json
sed -i '/#vless-kcp$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","email": "'""$user""'"' /etc/xray/config.json
vlesshttpnon="vless://${uuid}@${domain}:$vlhttpnon?sni=ojodumeh.org&security=none&type=tcp&headerType=http&encryption=none#%F0%9F%94%B0VLESS+HTTP+NONTLS+${user}"
vlesshttp="vless://${uuid}@${domain}:$vlhttp?sni=bugmu.xyz&host=${domain}&type=tcp&security=tls&path=/WISNU-TCP&headerType=http&encryption=none#%F0%9F%94%B0VLESS+HTTP+TLS+${user}"
vlesstls="vless://${uuid}@${domain}:$vltls?host=${domain}&sni=$domain&type=ws&security=tls&path=%2fWISNU&encryption=none#%F0%9F%94%B0VLESS+WS+TLS+${user}"
vlessnontls="vless://${uuid}@${domain}:$vlnontls?host=${domain}&security=none&type=ws&path=/WISNU&encryption=none#%F0%9F%94%B0VLESS+WS+NONTLS+${user}"
vlessgrpc="vless://${uuid}@${domain}:$vlgrpc?serviceName=COKRO&sni=${domain}&mode=multi&type=grpc&security=tls&encryption=none#%F0%9F%94%B0VLESS+GRPC+TLS+${user}"
vlessgrpcnon="vless://${uuid}@${domain}:$vlgrpcnon?serviceName=COKRO&sni=${domain}&mode=multi&type=grpc&security=none&encryption=none#%F0%9F%94%B0VLESS+GRPC+NONTLS+${user}"
vlesshdua="vless://${uuid}@${domain}:$vlhdua?sni=bugmu.com&type=http&security=tls&path=/WISNU-HTTP&encryption=none#%F0%9F%94%B0VLESS+H2C+${user}"
vlesskcp="vless://$uuid@$domain:$vlkcp?sni=$domain&seed=WISNU-KCP&type=kcp&security=tls&headerType=none&encryption=none#%F0%9F%94%B0VLESS+KCP+TLS+$user"
vlessxtls="vless://${uuid}@${domain}:$vlxtls?sni=remang-remang.night&security=xtls&encryption=none&flow=xtls-rprx-splice-udp443#%F0%9F%94%B0VLESS+XTLS+${user}"
vlessgfw="vless://${uuid}@${domain}:$vlxtls?sni=istimiwir.co.id&security=tls&encryption=none#%F0%9F%94%B0VLESS+GFW+${user}"
vlessquic="vless://$uuid@$MYIP:$vlquic?sni=$domain&key=WISNU-QUIC&security=tls&encryption=none&headerType=none&quicSecurity=$domain&type=quic#%F0%9F%94%B0VLESS+QUIC+TLS+$user"
systemctl restart xvless.service
systemctl restart xray.service
systemctl restart xtrojan.service
systemctl restart xvmess
service cron restart
#systemctl restart nginx
clear
echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\033[1;46m 🔰 AKUN VLESS TESTER 🔰  \e[m"   
echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "Protokol : WS,GRPC,HTTP,KCP,H2C,GFW,XTLS,QUIC"
echo -e "IP  :${MYIP} / $domain"
echo -e "NAMA  :${user}"
echo -e "Flow  :ONLY ORIGIN'S TYPE NOT ALLOWED"
echo -e "Port GRPC  :$vlgrpc/ $vlgrpcnon"
echo -e "Port HTTP  :$vlhttp/ $vlhttpnon"
echo -e "Port H2C  :$vlhdua"
echo -e "Port QUIC  :$vlquic"
echo -e "Port XTLS  :$vlxtls"
echo -e "Port WS  :$vltls / $vlnontls "
echo -e "Satpam  :tls,xtls"
echo -e "Path GRPC  :COKRO"
echo -e "Path HTTP  :/WISNU-TCP"
echo -e "Path H2C  :WISNU-HTTP"
echo -e "Path WS  :/WISNU"
echo -e "Path KCP  :WISNU-KCP"
echo -e "Path QUIC  :WISNU-QUIC"
echo -e "UserID  :${uuid}"
echo -e "Dibuat  :$hariini"
echo -e "Kadaluarsa  :$exp"
echo -e "━━━━━━━━━━━━━━━━━━━"
echo -e "QUIC: ${vlessquic}"
echo -e "━━━━━━━━━━━━━━━━━━━"
echo -e "XTLS: ${vlessxtls}"
echo -e "━━━━━━━━━━━━━━━━━━━"
echo -e "GRPC TLS: ${vlessgrpc}"
echo -e "━━━━━━━━━━━━━━━━━━━"
#echo -e "GRPC NONTLS: ${vlessgrpcnon}"
#echo -e "━━━━━━━━━━━━━━━━━━━"
echo -e "GFW: ${vlessgfw}"
echo -e "━━━━━━━━━━━━━━━━━━━"
echo -e "WS TLS: ${vlesstls}"
echo -e "━━━━━━━━━━━━━━━━━━━"
echo -e "WS NONTLS: ${vlessnontls}"
echo -e "━━━━━━━━━━━━━━━━━━━"
echo -e "H2C: ${vlesshdua}"
echo -e "━━━━━━━━━━━━━━━━━━━"
echo -e "HTTP TLS: ${vlesshttp}"
echo -e "━━━━━━━━━━━━━━━━━━━"
echo -e "HTTP NONTLS: ${vlesshttpnon}"
echo -e "━━━━━━━━━━━━━━━━━━━"
echo -e "VLESS KCP TLS: ${vlesskcp}"
echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\033[1;46m🔰LUXURY EDITION ZEROSSL🔰\e[m"   
echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo ""
read -n 1 -s -r -p "Ketik Bebas Untuk Ke Menu Utama"
menu
