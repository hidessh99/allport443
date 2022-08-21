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
opensshport="$(cat ~/log-install.txt | grep -w "PORT OPENSSH" | cut -d: -f2|sed 's/ //g')"
dropbearport="$(cat ~/log-install.txt | grep -w "PORT DROPBEAR" | cut -d: -f2|sed 's/ //g')"
otcp="$(cat ~/log-install.txt | grep -w "PORT OVPN TCP" | cut -d: -f2|sed 's/ //g')"
oudp="$(cat ~/log-install.txt | grep -w "PORT OVPN UDP" | cut -d: -f2|sed 's/ //g')"
ossl="$(cat ~/log-install.txt | grep -w "PORT OVPN SSL" | cut -d: -f2|sed 's/ //g')"
Login=tes`</dev/urandom tr -dc X-Z0-9 | head -c2`
hari="1"
Pass=1
clear
systemctl restart ws-tls
#systemctl restart ws-nontls
systemctl restart ws-ovpn
systemctl restart sslh
systemctl restart stunnel5
systemctl restart ssh-ohp
systemctl restart dropbear-ohp
systemctl restart openvpn-ohp
useradd -e `date -d "$masaaktif days" +"%Y-%m-%d"` -s /bin/false -M $Login
exp="$(chage -l $Login | grep "Account expires" | awk -F": " '{print $2}')"
hariini=`date -d "0 days" +"%Y-%m-%d"`
expi=`date -d "$masaaktif days" +"%Y-%m-%d"`
echo -e "$Pass\n$Pass\n"|passwd $Login &> /dev/null

echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\033[1;46m 🔰 TEST SSH DAN OVPN 🔰  \e[m"   
echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "IP : $MYIP/ ${domain}"
echo -e "Username       $off:$Login"
echo -e "Password       $off:$Pass"
echo -e "Dropbear       $off:${dropbearport}"
echo -e "SSL/TLS        $off:$ssl"
echo -e "Privoxy        $off:4000,5000"
echo -e "Squid          $off:$sqd"
echo -e "WS TLS         $off:$ws"
echo -e "WS NON TLS     $off:$ws2"
echo -e "OVPN WS TLS    $off:$otls"
echo -e "OVPN WS NONTLS $off:$onontls"
echo -e "Port TCP       $off:$otcp"
echo -e "Port UDP       $off:$oudp"
echo -e "Port SSL       $off:$ossl"
echo -e "UDPGW   :9100,9200,-->>9900"
echo -e "Created :$hariini"
echo -e "Expired :$expi"
echo -e "OVPN TCP:http://$MYIP:88/tcp.ovpn"
echo -e "━━━━━━━━━━━━━━━━━━━"
echo -e "OVPN UDP:http://$MYIP:88/udp.ovpn"
echo -e "━━━━━━━━━━━━━━━━━━━"
echo -e "OVPN SSL:http://$MYIP:88/ssl.ovpn"
echo -e "━━━━━━━━━━━━━━━━━━━"
echo -e "OVPN ZIP:http://$MYIP:88/gandring.zip"
echo -e "━━━━━━━━━━━━━━━━━━━"
echo -e "Payload SSH & OVPN WEBSOCKET"
echo -e "GET ws://bugmu.com [protocol][crlf]/ HTTP/1.1[crlf]Host: $domain[crlf]Upgrade: Websocket[crlf]Connection: Keep-Alive[crlf]User-Agent: [ua][crlf][crlf]"
echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\033[1;46m🔰LUXURY EDITION ZEROSSL🔰\e[m"   
echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
