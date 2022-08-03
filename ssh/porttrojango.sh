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
trgo="$(cat ~/log-install.txt | grep -w "TROJAN G0" | cut -d: -f2|sed 's/ //g')"
echo -e "======================================"
echo -e ""
echo -e "Ganti Port $trgo"
echo -e ""
echo -e "======================================"
read -p "Port Baru TROJAN-GO : " trgo2
if [ -z $trgo2 ]; then
echo "Please Input Port"
exit 0
fi
cek=$(netstat -nutlp | grep -w $trgo2)
if [[ -z $cek ]]; then
sed -i "s/$tr/$trgo2/g" /etc/xray/config.json
sed -i "s/   - TROJAN GO         : $tr/   - TROJAN GO         : $tr2/g" /root/log-install.txt
iptables -D INPUT -m state --state NEW -m tcp -p tcp --dport $trgo -j ACCEPT
iptables -D INPUT -m state --state NEW -m udp -p udp --dport $trgo -j ACCEPT
iptables -I INPUT -m state --state NEW -m tcp -p tcp --dport $trgo2 -j ACCEPT
iptables -I INPUT -m state --state NEW -m udp -p udp --dport $trgo2 -j ACCEPT
iptables-save > /etc/iptables.up.rules
iptables-restore -t < /etc/iptables.up.rules
netfilter-persistent save > /dev/null
netfilter-persistent reload > /dev/null
systemctl restart xray.service > /dev/null
echo -e "\e[032;1mPort $trgo2 modified successfully\e[0m"
else
echo "Port $trgo2 is used"
fi
