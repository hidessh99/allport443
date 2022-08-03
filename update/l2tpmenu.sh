#!/bin/bash
clear
m="\033[0;1;36m"
y="\033[0;1;37m"
yy="\033[0;1;32m"
yl='\e[031;1m'
bl='\e[36;1m'
gl='\e[32;1m'
RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHT='\033[0;37m'
bg_red='\033[0;41m'
bg_green='\033[0;42m'
bg_yellow='\033[0;43m'
bg_blue='\033[0;44m'
bg_magenta='\033[0;45m'
bg_cyan='\033[0;46m'
#cat /usr/bin/bannerL2TP | lolcat
echo -e ""
echo -e "\033[1;46m══════════════════════════════════\033[0m"
echo -e "\e[1;31m)  MENU LAYANAN L2TP \e[m"
echo -e "\033[1;46m══════════════════════════════════\033[0m"
echo -e "1\e[1;33m) Buat Akun L2TP \e[m"
echo -e "2\e[1;33m) Hapus Akun L2TP \e[m"
echo -e "3\e[1;33m) Perpanjang Masa Aktif Akun L2TP \e[m"
echo -e "0\e[1;31m) Menu Utama \e[m"
echo -e "x\e[1;31m) Keluar \e[m"
echo -e "\033[1;46m══════Luxury Edition by ZEROSSL══\033[0m"
read -p "Silahkan Pilih Angka [ 1 - 0 ] : " menu
echo -e ""
case $menu in
1)
addl2tp
;;
2)
dell2tp
;;
3)
renewl2tp
;;
0)
clear
menu
;;
x)
clear
exit
;;
*)
clear
menu
;;
esac
