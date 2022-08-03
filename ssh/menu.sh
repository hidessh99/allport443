#!/bin/bash
#script by wisnu cokro satrio
m="\033[0;1;36m"
y="\033[0;1;37m"
yy="\033[0;1;32m"
yl='\e[031;1m'
bl='\e[36;1m'
gl='\e[32;1m'
#cat /usr/bin/bannerku | lolcat
echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\E[44;1;46m             🔰 PRESTIGE SERVER ZEROSSL 🔰              \E[0m"
echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m" 
echo -e "01\e[0;33m) MENU LAYANAN WIREGUARD®  \e[m"
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "02\e[0;33m) MENU LAYANAN SHADOWSOCKS  \e[m"
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "03\e[0;33m) MENU LAYANAN SSH DAN OPENVPN \e[m"
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "04\e[0;33m) MENU LAYANAN TROJAN GO DAN HTTP \e[m"
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "05\e[0;33m) MENU LAYANAN L2TP PPTP DAN SSTP \e[m"
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "06\e[0;33m) Menu LAYANAN TROJAN XTLS DAN GFW \e[m"
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "07\e[0;33m) MENU LAYANAN VLESS XTLS WEBS DAN GRPC \e[m"
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "08\e[0;33m) MENU LAYANAN TROJAN GRPC DAN WEBSOCKET \e[m"
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "09\e[0;33m) MENU LAYANAN VMESS WEBS GRPC DAN HTTP/2 \e[m"
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "10\e[0;33m) MENU LAYANAN KONFIGURASI SERVER ANDA \e[m"
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "00\e[1;31m) Nomer Iki Metu Kang Mass \e[m"
echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\033[1;46m             🔰 LUXURY EDITION BY ZEROSSL 🔰            \E[0m"
echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
#echo -e "\e[0;31m   ⇱ TEKAN K UNTUK KE VERSI LONDO ⇲  \e[m"
echo -e "\e[0;31m   ⇱ PRESS K FOR ENGLISH VERSION ⇲   \e[m"
read -p "   ⇱ Silahkan Pilih Angka [ 1 - 0 ] ⇲: " menu
echo -e ""
case $menu in
1)
clear
wgmenu
;;
2)
clear
ssmenu
;;
3)
clear
sshovpn
;;
4)
clear
trghmenu
;;
5)
clear
l2tppmenu
;;
6)
clear
trxtmenu
;;
7)
clear
vlessmenu
;;
8)
clear
trpcwsmenu
;;
9)
clear
vmessmenu
;;
10)
clear
setmenu
;;
0)
clear
exit
;;
k)
clear
menuu
;;
*)
clear
menu
;;
esac
