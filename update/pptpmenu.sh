#!/bin/bash
clear
m="\033[0;1;36m"
y="\033[0;1;37m"
yy="\033[0;1;32m"
yl="\033[0;1;33m"
wh="\033[0m"
#cat /usr/bin/bannerPPTP | lolcat
echo -e ""
echo -e "\033[1;46m══════════════════════════════════════\033[0m"
echo -e "\e[1;31m)   MENU LAYANAN PPTP \e[m"
echo -e "\033[1;46m══════════════════════════════════════\033[0m"
echo -e "1\e[1;33m) Buat Akun PPTP \e[m"
echo -e "2\e[1;33m) Hapus Akun PPTP \e[m"
echo -e "3\e[1;33m) Perpanjang Masa Aktif Akun PPTP \e[m"
echo -e "0\e[1;31m) Menu Utama \e[m"
echo -e "x\e[1;31m) Keluar \e[m"
echo -e "\033[1;46m═════════LUXURY EDITION BY ZEROSSL════\033[0m"
read -p "Silahkan Pilih Angka [ 1 - 0 ] : " menu
echo -e ""
case $menu in
1)
addpptp
;;
2)
delpptp
;;
3)
renewpptp
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
