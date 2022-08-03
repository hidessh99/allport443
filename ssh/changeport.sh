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
echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\E[46;1;46m                 🔰 MENU GANTI PORT 🔰                  \E[0m"
echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "[01]. Ganti Port OpenVPN"
echo -e "[02]. Ganti Port Wireguard"
echo -e "[03]. Ganti Port Vmess + Vless"
echo -e "[04]. Ganti Port Trojan-GFW"
echo -e "[05]. Ganti Port Squid"
echo -e "[06]. Ganti Port SSTP"
echo -e "[07]. Ganti Port sshws non tls"
echo -e "[08]. Ganti Port sshws  tls"
echo -e "[09]. Ganti Port dropbear"
echo -e "[10]. Ganti Port openssh"
echo -e "[11]. Ganti Port Stunnel5"
echo -e "[12]. Ganti Port Trojan-GO"
echo -e "[12]. Ganti Port GRPC"
echo -e "[00]. Menu"
echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\E[46;1;46m            🔰 LUXURY EDITION BY ZEROSSL 🔰             \E[0m"
echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
read -p "Silahkan Pilih Angka [ 1-0 ] : " port
echo -e ""
case $port in
1)
portovpn
;;
2)
portwg
;;
3)
portvlm
;;
4)
porttrojan
;;
5)
portsquid
;;
6)
portsstp
;;
7)
portsshwsnontls
;;
8)
portsshwstls
;;
9)
portdropbear
;;
10)
portopenssh
;;
11)
portstunnel5
;;
12)
porttrojango
;;
13)
portgrpc
;;
0)
clear
menu
;;
*)
echo "Please enter an correct number"
;;
esac
