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
MYIP=$(wget -qO- ipinfo.io/ip);
MYIP6=$(wget -qO- https://ipv6.icanhazip.com)
clear
domain=$(cat /etc/xray/domain)
ssl="$(cat ~/log-install.txt | grep -w "PORT STUNNEL5" | cut -d: -f2)"
sqd="$(cat ~/log-install.txt | grep -w "PORT SQUID" | cut -d: -f2)"
ws="$(cat ~/log-install.txt | grep -w "WEBSOCKET TLS" | cut -d: -f2|sed 's/ //g')"
ws2="$(cat ~/log-install.txt | grep -w "WEBSOCKET NON TLS" | cut -d: -f2|sed 's/ //g')"
onontls="$(cat ~/log-install.txt | grep -w "PORT OVPN WS NON TLS" | cut -d: -f2|sed 's/ //g')"
otls="$(cat ~/log-install.txt | grep -w "PORT OVPN WS TLS" | cut -d: -f2|sed 's/ //g')"
stunnel5port="$(cat ~/log-install.txt | grep -w "PORT STUNNEL5" | cut -d: -f2|sed 's/ //g')"
udpgw="$(cat ~/log-install.txt | grep -w "PORT UDPGW" | cut -d: -f2|sed 's/ //g')"
priv="$(cat ~/log-install.txt | grep -w "PORT PRIVOXY" | cut -d: -f2|sed 's/ //g')"
opensshport="$(cat ~/log-install.txt | grep -w "PORT OPENSSH" | cut -d: -f2|sed 's/ //g')"
dropbearport="$(cat ~/log-install.txt | grep -w "PORT DROPBEAR" | cut -d: -f2|sed 's/ //g')"
otcp="$(cat ~/log-install.txt | grep -w "PORT OVPN TCP" | cut -d: -f2|sed 's/ //g')"
oudp="$(cat ~/log-install.txt | grep -w "PORT OVPN UDP" | cut -d: -f2|sed 's/ //g')"
ossl="$(cat ~/log-install.txt | grep -w "PORT OVPN SSL" | cut -d: -f2|sed 's/ //g')"
Login=tes`</dev/urandom tr -dc X-Z0-9 | head -c2`
hari="1"
Pass=1
clear
systemctl restart stunnelws
systemctl restart nontls
systemctl restart otls
systemctl restart openvpnws
systemctl restart sslh
systemctl restart stunnel5
systemctl restart ssh-ohp
systemctl restart dropbear-ohp
systemctl restart openvpn-ohp
systemctl restart privoxy
#systemctl restart nginx
useradd -e `date -d "$masaaktif days" +"%Y-%m-%d"` -s /bin/false -M $Login
exp="$(chage -l $Login | grep "Account expires" | awk -F": " '{print $2}')"
hariini=`date -d "0 days" +"%Y-%m-%d"`
expi=`date -d "$masaaktif days" +"%Y-%m-%d"`
echo -e "$Pass\n$Pass\n"|passwd $Login &> /dev/null

echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\033[1;46m 🔰 TEST SSH DAN OVPN 🔰  \e[m"   
echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "🔵HOST ➡️ ${domain}"
echo -e "🔵USERNAME ➡️ $Login"
echo -e "🔵PASSWORD ➡️ $Pass"
echo -e "🔵DROPBEAR ➡️ $dropbearport"
echo -e "🔵OPENSSH ➡️ $openssh"
echo -e "🔵STUNNEL 5 ➡️ $stunnel5port"
echo -e "🔵WS TLS ➡️ $ws"
echo -e "🔵OVPN SSL ➡️ $ossl"
echo -e "🔵Link OVPN ➡️ http://$MYIP:88/"
echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "🔵WS NONTLS ➡️ 8880red,80green"
echo -e "🔵OVPN WS ➡️ $onontls"
echo -e "🔵OVPN UDP ➡️ $oudp"
echo -e "🔵PRIVOXY ➡️ $priv"
echo -e "🔵SQUID 4 ➡️ $sqd"
echo -e "🔵UDPGW ➡️ $udpgw"
echo -e "🔵Dibuat ➡️ $hariini"
echo -e "🔵Kadaluarsa ➡️ $expi"
echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "🔵 GET ws://bugmu.com [protocol][crlf]/HTTP/1.1[crlf]/HTTP/2[crlf]/HTTP/3[crlf]Host: $domain[crlf]Upgrade: Websocket[crlf]Connection: Keep-Alive[crlf]User-Agent: [ua][crlf][crlf]"
echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\033[1;46m🔰LUXURY EDITION ZEROSSL🔰\e[m"   
echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo ""
read -n 1 -s -r -p "Ketik Bebas Untuk Ke Menu Utama"
menu
