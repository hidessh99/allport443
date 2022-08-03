#!/bin/bash
# wisnu
clear
#cat /usr/bin/bannerTROJAN | lolcat
echo -e ""
echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\E[43;1;46m   🔰 MENU VLESS XTLS GFW H2C GRPC WS HTTP & GO 🔰     \e[0m"
echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "01\e[1;33m) Buat Akun VLESS WEBSOCKET  \e[m"
echo -e "02\e[1;33m) Hapus Akun VLESS WEBSOCKET  \e[m"
echo -e "03\e[1;33m) Perpanjang Masa Aktif Akun VLESS WEBSOCKET  \e[m"
echo -e "04\e[1;33m) Cek User Login VLESS WEBSOCKET  \e[m"
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "05\e[1;33m) Buat Akun VLESS GRPC \e[m"
echo -e "06\e[1;33m) Hapus Akun VLESS GRPC \e[m"
echo -e "07\e[1;33m) Perpanjang Masa Aktif Akun VLESS GRPC \e[m"
echo -e "08\e[1;33m) Cek User Login VLESS GRPC \e[m"
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "09\e[1;33m) Buat Akun VLESS H2C \e[m"
echo -e "10\e[1;33m) Hapus Akun VLESS H2C \e[m"
echo -e "11\e[1;33m) Perpanjang Masa Aktif Akun VLESS H2C \e[m"
echo -e "12\e[1;33m) Cek User Login VLESS H2C \e[m"
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "13\e[1;33m) Buat Akun VLESS XTLS \e[m"
echo -e "14\e[1;33m) Hapus Akun VLESS XTLS  \e[m"
echo -e "15\e[1;33m) Perpanjang Masa Aktif Akun VLESS XTLS  \e[m"
echo -e "16\e[1;33m) Cek User Login VLESS XTLS  \e[m"
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "17\e[1;33m) Buat Akun VLESS HTTP \e[m"
echo -e "18\e[1;33m) Hapus Akun VLESS HTTP \e[m"
echo -e "19\e[1;33m) Perpanjang Masa Aktif Akun VLESS HTTP \e[m"
echo -e "20\e[1;33m) Cek User Login VLESS HTTP \e[m"
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "21\e[1;33m) Buat Akun VLESS QUIC \e[m"
echo -e "22\e[1;33m) Hapus Akun VLESS QUIC \e[m"
echo -e "23\e[1;33m) Perpanjang Masa Aktif Akun VLESS QUIC \e[m"
echo -e "24\e[1;33m) Cek User Login VLESS QUIC \e[m"
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "25\e[1;33m) Buat Akun VLESS KCP \e[m"
echo -e "26\e[1;33m) Hapus Akun VLESS KCP \e[m"
echo -e "27\e[1;33m) Perpanjang Masa Aktif Akun VLESS KCP \e[m"
echo -e "28\e[1;33m) Cek User Login VLESS KCP \e[m"
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "00\e[1;31m) Menu Utama \e[m"
echo -e "xx\e[1;31m) Keluar \e[m"
echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\E[43;1;46m             🔰 LUXURY EDITION BY ZEROSSL 🔰            \e[0m"
echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
read -p "Silahkan Pilih Angka[ 1 - 0 ] : " menu
echo -e ""
case $menu in
1)
addvless
;;
2)
delvless
;;
3)
renewvless
;;
4)
cekvless
;;
5)
addvlessgrpc
;;
6)
delvlessgrpc
;;
7)
renewvlessgroc
;;
8)
cekvlessgrpc
;;
9)
addvlesshdua
;;
10)
delvlesshdua
;;
11)
renewvlesshdua
;;
12)
cekvlesshdua
;;
13)
addvlessxtls
;;
14)
delvlessxtls
;;
15)
renewvlessxtls
;;
16)
cekvlessxtls
;;
17)
addvlesshttp
;;
18)
delvlesshttp
;;
19)
renewvlesshttp
;;
20)
cekvlesshttp
;;
21)
addvlessquic
;;
22)
delvlessquic
;;
23)
renewvlessquic
;;
24)
cekvlessquic
;;
25)
addvlesskcp
;;
26)
delvlesskcp
;;
27)
renewvlesskcp
;;
28)
cekvlesskcp
;;
0)
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
