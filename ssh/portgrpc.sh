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
echo "Checking VPS"
IZIN=$(wget -qO- ipinfo.io/ip);
grpc="$(cat ~/log-install.txt | grep -w "VMESS GRPC" | cut -d: -f2|sed 's/ //g'"
grpc="$(cat ~/log-install.txt | grep -w "VLESS GRPC" | cut -d: -f2|sed 's/ //g')"
echo -e "======================================"
echo -e ""
echo -e "[1]. Ganti Port VMESS GRPC $grpc"
echo -e "[2]. Ganti Port VLESS GRPC $grpc"
echo -e "[3]. Keluar"
echo -e ""
echo -e "======================================"
echo -e ""
read -p "Silahkan Pilih Angka [ 1-3 ] : " prot
echo -e ""
case $prot in
1)
read -p "Port Baru VMESS GRPC : " grpc1
if [ -z $tls1 ]; then
echo "Silahkan masukan port KESAYANGAN"
exit 0
fi
cek=$(netstat -nutlp | grep -w $grpc1)
if [[ -z $cek ]]; then
sed -i "s/$grpc/$grpc1/g" /etc/xray/config.json
sed -i "s/   - VMESS GRPC         : $grpc/   - VMESS GRPC         : $grpc1/g" /root/log-install.txt
sed -i "s/   - VLESS GRPC         : $grpc/   - VLESS GRPC         : $grpc1/g" /root/log-install.txt
iptables -D INPUT -m state --state NEW -m tcp -p tcp --dport $grpc -j ACCEPT
iptables -D INPUT -m state --state NEW -m udp -p udp --dport $grpc -j ACCEPT
iptables -I INPUT -m state --state NEW -m tcp -p tcp --dport $grpc1 -j ACCEPT
iptables -I INPUT -m state --state NEW -m udp -p udp --dport $grpc1 -j ACCEPT
iptables-save > /etc/iptables.up.rules
iptables-restore -t < /etc/iptables.up.rules
netfilter-persistent save > /dev/null
netfilter-persistent reload > /dev/null
systemctl restart xray.service > /dev/null
echo -e "\e[032;1mPort $grpc1 modified successfully\e[0m"
else
echo "Port $grpc1 is used"
fi

3)
exit
menu
;;
*)
echo "Please enter an correct number"
;;
esac
