#!/bin/bash
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
domain=$(cat /etc/xray/domain)
clear
read -p "Username : " Login
read -p "Password : " Pass
read -p "Expired (Days): " masaaktif

clear

if [ -e "/var/log/auth.log" ]; then
        LOG="/var/log/auth.log";
fi
data=( `ps aux | grep -i dropbear | awk '{print $2}'`);
cat $LOG | grep -i dropbear | grep -i "Password auth succeeded" > /tmp/login-db.txt;
for PID in "${data[@]}"
do
        cat /tmp/login-db.txt | grep "dropbear\[$PID\]" > /tmp/login-db-pid.txt;
        NUM=`cat /tmp/login-db-pid.txt | wc -l`;
        USER=`cat /tmp/login-db-pid.txt | awk '{print $10}'`;
        IP=`cat /tmp/login-db-pid.txt | awk '{print $12}'`;
        if [ $NUM -eq 1 ]; then
                echo "$PID - $USER - $IP";
                fi
done
MYIP=$(wget -qO- ipinfo.io/ip);
MYIP6=$(wget -qO- https://ipv6.icanhazip.com);
ws="$(cat ~/log-install.txt | grep -w "WEBSOCKET TLS" | cut -d: -f2|sed 's/ //g')"
otcp="$(cat ~/log-install.txt | grep -w "PORT OVPN TCP" | cut -d: -f2|sed 's/ //g')"
oudp="$(cat ~/log-install.txt | grep -w "PORT OVPN UDP" | cut -d: -f2|sed 's/ //g')"
ossl="$(cat ~/log-install.txt | grep -w "PORT OVPN SSL" | cut -d: -f2|sed 's/ //g')"
otls="$(cat ~/log-install.txt | grep -w "PORT OVPN WS TLS" | cut -d: -f2|sed 's/ //g')"
onontls="$(cat ~/log-install.txt | grep -w "PORT OVPN WS NON TLS" | cut -d: -f2|sed 's/ //g')"
ws2="$(cat ~/log-install.txt | grep -w "WEBSOCKET NON TLS" | cut -d: -f2|sed 's/ //g')"
stunnel5port="$(cat ~/log-install.txt | grep -w "PORT STUNNEL5" | cut -d: -f2|sed 's/ //g')"
opensshport="$(cat ~/log-install.txt | grep -w "PORT OPENSSH" | cut -d: -f2|sed 's/ //g')"
dropbearport="$(cat ~/log-install.txt | grep -w "PORT DROPBEAR" | cut -d: -f2|sed 's/ //g')"
ssl="$(cat ~/log-install.txt | grep -w "PORT STUNNEL5" | cut -d: -f2)"
sqd="$(cat ~/log-install.txt | grep -w "PORT SQUID" | cut -d: -f2)"
ovpn="$(netstat -nlpt | grep -i openvpn | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"
ovpn2="$(netstat -nlpu | grep -i openvpn | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"
ovpn3="$(netstat -nlpt | grep -i openvpn | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"

useradd -e `date -d "$masaaktif days" +"%Y-%m-%d"` -s /bin/false -M $Login
expi="$(chage -l $Login | grep "Account expires" | awk -F": " '{print $2}')"
echo -e "$Pass\n$Pass\n"|passwd $Login &> /dev/null
hariini=`date -d "0 days" +"%Y-%m-%d"`
expi=`date -d "$masaaktif days" +"%Y-%m-%d"`

systemctl restart tls
systemctl restart stunnel5
systemctl restart sslh
systemctl restart wsovpn
systemctl restart nontls
systemctl restart otls
systemctl restart ssh-ohp
systemctl restart stunnel-ohp
systemctl restart dropbear-ohp
systemctl restart openvpn-ohp
#systemctl restart privoxy
#systemctl restart nginx
echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\033[1;46m 🔰 AKUN SSH DAN OVPN 🔰  \e[m"   
echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "🔷️HOST 🔹️ ${domain}"
echo -e "🔷️USERNAME 🔹️ $Login"
echo -e "🔷️PASSWORD 🔹️ $Pass"
echo -e "🔷️DIRECT DROPBEAR 🔹️ ${dropbearport}"
echo -e "🔷️DIRECT OPENSSH 🔹️ ${opensshport}"
echo -e "🔷️STUNNEL 5 🔹️ $ssl"
echo -e "🔷️WS TLS 🔹️ $ws"
echo -e "🔷️OVPN SSL 🔹️ $ossl"
echo -e "🔷️WS NONTLS 🔹️ $ws2/red green response"
echo -e "🔷️OVPN WS 🔹️ $onontls"
echo -e "🔷️OVPN TCP 🔹️ $otcp"
echo -e "🔷️OVPN UDP 🔹️ $oudp"
echo -e "🔷️PRIVOXY 🔹️ 3128,3228"
echo -e "🔷️SQUID 4 🔹️ $sqd"
echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "🔷️UDPGW 🔹️ 9100,9200-9900"
echo -e "🔷️Dibuat 🔹️ $hariini"
echo -e "🔷️Kadaluarsa 🔹️ $expi"
echo -e "🔷️Link OVPN 🔹️ http://$MYIP:88/"
echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "🔷️ GET ws://bugmu.com [protocol][crlf]/HTTP/1.1[crlf]/HTTP/2[crlf]/HTTP/3[crlf]Host: $domain[crlf]Upgrade: Websocket[crlf]Connection: Keep-Alive[crlf]User-Agent: [ua][crlf][crlf]"
echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\033[1;46m🔰LUXURY EDITION ZEROSSL🔰\e[m"   
echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo ""
read -n 1 -s -r -p "Ketik Bebas Untuk Ke Menu Utama"
menu
