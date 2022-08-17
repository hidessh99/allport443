#!/bin/bash
# wisnucokrosatrio
#cat /usr/bin/bannerVLESS | lolcat
echo -e ""
echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\E[43;1;46m               🔰 MENU LAYANAN VMESS 🔰                 \e[0m"
echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "01\e[1;33m) Buat Akun VMESS WEBSOCKET \e[m"
echo -e "02\e[1;33m) Hapus Akun VMESS WEBSOCKET \e[m"
echo -e "03\e[1;33m) Perpanjang Masa Aktif Akun VMESS WEBSOCKET \e[m"
echo -e "04\e[1;33m) Cek User Login VMESS WEBSOCKET \e[m"
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "05\e[1;33m) Buat Akun VMESS GRPC \e[m"
echo -e "06\e[1;33m) Hapus Akun VMESS GRPC \e[m"
echo -e "07\e[1;33m) Perpanjang Masa Aktif Akun VMESS GRPC \e[m"
echo -e "08\e[1;33m) Cek User Login VMESS GRPC \e[m"
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "09\e[1;33m) Buat Akun VMESS HTTP/2 \e[m"
echo -e "10\e[1;33m) Hapus Akun VMESS HTTP/2 \e[m"
echo -e "11\e[1;33m) Perpanjang Masa Aktif Akun Vmess HTTP/2 \e[m"
echo -e "12\e[1;33m) Cek User Login VMESS HTTP/2 \e[m"
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "13\e[1;33m) Buat Akun VMESS HTTP \e[m"
echo -e "14\e[1;33m) Hapus Akun VMESS HTTP \e[m"
echo -e "15\e[1;33m) Perpanjang Masa Aktif Akun VMESS HTTP \e[m"
echo -e "16\e[1;33m) Cek User Login VMESS HTTP \e[m"
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "17\e[1;33m) Buat Akun VMESS QUIC \e[m"
echo -e "18\e[1;33m) Hapus Akun VMESS QUIC \e[m"
echo -e "19\e[1;33m) Perpanjang Masa Aktif Akun VMESS QUIC \e[m"
echo -e "20\e[1;33m) Cek User Login VMESS QUIC \e[m"
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "21\e[1;33m) Buat Akun VMESS KCP \e[m"
echo -e "22\e[1;33m) Hapus Akun VMESS KCP \e[m"
echo -e "23\e[1;33m) Perpanjang Masa Aktif Akun VMESS KCP \e[m"
echo -e "24\e[1;33m) Cek User Login VMESS KCP \e[m"
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "25\e[1;31m) Cek Trafik User \e[m"
echo -e "00\e[1;31m) Menu Utama \e[m"
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "xx\e[1;31m) Keluar \e[m"
echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\E[43;1;46m            🔰 LUXURY EDITION BY ZEROSSL 🔰             \e[0m"
echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
read -p "Silahkan Pilih Angka[ 1 - 0 ] : " menu
echo -e ""
case $menu in
1)
addvmess
;;
2)
delvmess
;;
3)
renewvmess
;;
4)
cekvmess
;;
5)
addvmessgrpc
;;
6)
delvmessgrpc
;;
7)
renewvmessgrpc
;;
8)
cekvmessgrpc
;;
9)
addvmesshdua
;;
10)
delvmesshdua
;;
11)
renewvmesshdua
;;
12)
cekvmesshdua
;;
13)
addvmesshttp
;;
14)
delvmesshttp
;;
15)
renewvmesshttp
;;
16)
cekvmesshttp
;;
17)
addvmessquic
;;
18)
delvmessquic
;;
19)
renewvmessquic
;;
20)
cekvmesshttp
;;
21)
addvmesshkcp
;;
22)
delvmesskcp
;;
23)
renewvmesskcp
;;
24)
cekvmesskcp
;;
25)
trafikcek
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
