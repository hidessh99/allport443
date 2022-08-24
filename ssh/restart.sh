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
clear
echo -e ""
echo -e "Memulai Ulang Layanan Tunnel"
sleep 2
systemctl restart ssrmu
systemctl restart ws-tls
systemctl restart ovpn-tls
systemctl restart ws-nontls
#systemctl restart stunnel-ohp
systemctl restart xray.service
systemctl restart shadowsocks-libev
systemctl restart xl2tpd
systemctl restart pptpd
systemctl restart ipsec
systemctl restart accel-ppp
systemctl restart ws-ovpn
systemctl restart wg-quick@wg0
systemctl restart sslh
systemctl restart xtrojan
systemctl restart xvless
systemctl restart xvmess
systemctl restart xss
systemctl restart ssh-ohp
systemctl restart dropbear-ohp
systemctl restart openvpn-ohp
systemctl restart trojan-go
/etc/init.d/ssrmu restart
/etc/init.d/ssh restart
/etc/init.d/dropbear restart
/etc/init.d/sslh restart
/etc/init.d/stunnel5 restart
/etc/init.d/openvpn restart
/etc/init.d/fail2ban restart
/etc/init.d/cron restart
/etc/init.d/nginx restart
systemctl restart ssrmu
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:9100 --max-clients 100
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:9200 --max-clients 100
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:9300 --max-clients 100
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:9400 --max-clients 100
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:9500 --max-clients 100
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:9600 --max-clients 100
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:9700 --max-clients 100
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:9800 --max-clients 100
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:9900 --max-clients 100
echo -e "Mulai Ulang Layanan Berhasil"
