#!/bin/bash
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
tgl=`date +"%Y-%m-%d" -d "$dateFromServer"`
#modding by gandring
#########################

MYIP=$(curl -sS ipv4.icanhazip.com)

portdb=`cat /root/log-install.txt | grep -w "PORT DROPBEAR" | cut -d: -f2|sed 's/ //g' | cut -f2 -d","`
portdb2=`cat /root/log-install.txt | grep -w "PORT DROPBEAR" | cut -d: -f2|sed 's/ //g' | cut -f1 -d","`
portsshws=`cat /root/log-install.txt | grep -w "WEBSOCKET NON TLS" | cut -d: -f2 | awk '{print $1}'`
portsshwstls=`cat /root/log-install.txt | grep -w "WEBSOCKET TLS" | cut -d: -f2 | awk '{print $1}'`
portovpnws=`cat /root/log-install.txt | grep -w "OVPN WEBSOCKET NON TLS" | cut -d: -f2 | awk '{print $1}'`
portovpnwstls=`cat /root/log-install.txt | grep -w "OVPN WEBSOCKET TLS" | cut -d: -f2 | awk '{print $1}'`
portovpntcp=`cat /root/log-install.txt | grep -w "OVPN TCP" | cut -d: -f2 | awk '{print $1}'`

if [ -f "/etc/systemd/system/sshws.service" ]; then
clear
else
wget -q -O /usr/bin/proxy3.js "https://raw.githubusercontent.com/inoyaksorojawi/large/sae/ssh/proxy3.js"
cat <<EOF> /etc/systemd/system/sshws.service
[Unit]
Description=WSenabler
Documentation=https://t.me/zerossl

[Service]
Type=simple
User=root
ExecStart=/usr/bin/ssh-wsenabler
KillMode=process
Restart=on-failure
RestartSec=1s

[Install]
WantedBy=multi-user.target
EOF
fi

Green_font_prefix="\033[32m" && Red_font_prefix="\033[31m" && Green_background_prefix="\033[42;37m" && Red_background_prefix="\033[41;37m" && Font_color_suffix="\033[0m"
Info="${Green_font_prefix}[ON]${Font_color_suffix}"
Error="${Red_font_prefix}[OFF]${Font_color_suffix}"

function start() {
PID=`ps -ef |grep -v grep | grep sshws |awk '{print $2}'`
if [[ ! -z "${PID}" ]]; then
echo "Already ON !"
else
wget -q -O /usr/bin/ssh-wsenabler "https://raw.githubusercontent.com/inoyaksorojawi/large/sae/ssh/sshws-true.sh" && chmod +x /usr/bin/ssh-wsenabler && /usr/bin/ssh-wsenabler
systemctl daemon-reload >/dev/null 2>&1
systemctl enable sshws.service >/dev/null 2>&1
systemctl start sshws.service >/dev/null 2>&1
sed -i "/SSH Websocket/c\   - SSH Websocket           : $portsshws [ON]" /root/log-install.txt
echo -e "${green}SSH Websocket Started${NC}"
fi
}

function stop() {
PID=`ps -ef |grep -v grep | grep sshws |awk '{print $2}'`
if [[ ! -z "${PID}" ]]; then
systemctl stop sshws.service
tmux kill-session -t sshws
sed -i "/SSH Websocket/c\   - SSH Websocket           : $portsshws [OFF]" /root/log-install.txt
echo -e "${red}SSH Websocket Stopped${NC}"
fi
}

clear
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\E[44;1;39m          ⇱ SSH WEBSOCKET ⇲          \E[0m"
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━\033[0m"
echo ""
echo -e " 1. Enable SSH Websocket"
echo -e " 2. Disable SSh Websocket"
echo ""
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━\033[0m"
echo ""
read -rp "Input Number : " -e num
if [[ "$num" = "1" ]]; then
start
elif [[ "$num" = "2" ]]; then
stop
else
clear
menu
fi
read -n 1 -s -r -p "Press any key to back on menu"

sshovpnmenu

