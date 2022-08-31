#!/bin/bash
# Ohp Script
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
# Direct Proxy Squid For OpenVPN TCP

RED='\e[1;31m'
GREEN='\e[0;32m'
BLUE='\e[0;34m'
NC='\e[0m'
MYIP=$(wget -qO- https://icanhazip.com);
MYIP2="s/xxxxxxxxx/$MYIP/g";

# Update Repository VPS
clear
apt update 
apt-get -y upgrade

# Port Server
Port_OpenVPN_TCP='700';
Port_Squid='3128';
Port_Openvpn='8383';
Port_Dropbear='8282';
Port_ssh='8181';

# Installing ohp Server
cd 
wget -O /usr/local/bin/ohp "https://raw.githubusercontent.com/geovpn/bc/main/ohp/ohp"
chmod +x /usr/local/bin/ohp
# Buat File OpenVPN TCP OHP
cat > /etc/openvpn/GANDRING-SSL-WS.ovpn <<END
setenv CLIENT_CERT 0
setenv opt block-outside-dns
client
dev tun
proto tcp
remote xxxxxxxxx 443
persist-tun
persist-key
persist-remote-ip
comp-lzo
reneg-sec 0
pull
resolv-retry infinite
remote-cert-tls server
verb 3
auth-user-pass
cipher none
auth none
auth-nocache
script-security 2
tls-version-min 1.2
tls-cipher TLS-ECDHE-ECDSA-WITH-AES-128-GCM-SHA256
http-proxy xxxxxxxxx 8080
http-proxy-option VERSION 1.1
http-proxy-option CUSTOM-HEADER ""
http-proxy-option CUSTOM-HEADER "Host: "
http-proxy-option CUSTOM-HEADER "X-Forwarded-Host: "
http-proxy-option CUSTOM-HEADER ""
END
sed -i $MYIP2 /etc/openvpn/GANDRING-SSL-WS.ovpn;

# masukkan certificatenya ke dalam config client TCP 443
echo '<ca>' >> /etc/openvpn/GANDRING-SSL-WS.ovpn
cat /etc/openvpn/server/ca.crt >> /etc/openvpn/GANDRING-SSL-WS.ovpn
echo '</ca>' >> /etc/openvpn/GANDRING-SSL-WS.ovpn
cp /etc/openvpn/GANDRING-SSL-WS.ovpn /home/vps/public_html/GANDRING-SSL-WS.ovpn
clear
cd 
# Download File Ohp
wget https://github.com/lfasmpao/open-http-puncher/releases/download/0.1/ohpserver-linux32.zip
unzip ohpserver-linux32.zip
chmod +x ohpserver
cp ohpserver /usr/local/bin/ohpserver
/bin/rm -rf ohpserver*

# Installing Service
# SSH OHP Port 8181
cat > /etc/systemd/system/ssh-ohp.service << END
[Unit]
Description=SSH OHP Redirection Service
Documentation=https://t.me/zerossl
After=network.target nss-lookup.target

[Service]
Type=simple
User=root
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
NoNewPrivileges=true
ExecStart=/usr/local/bin/ohpserver -port 8181 -proxy 127.0.0.1:3228 -tunnel 127.0.0.1:200
Restart=on-failure
LimitNOFILE=infinity

[Install]
WantedBy=multi-user.target
END

# Dropbear OHP 8282
cat > /etc/systemd/system/dropbear-ohp.service << END
[Unit]]
Description=Dropbear OHP Redirection Service
Documentation=https://t.me/zerossl
After=network.target nss-lookup.target

[Service]
Type=simple
User=root
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
NoNewPrivileges=true
ExecStart=/usr/local/bin/ohpserver -port 8282 -proxy 127.0.0.1:3228 -tunnel 127.0.0.1:300
Restart=on-failure
LimitNOFILE=infinity

[Install]
WantedBy=multi-user.target
END

# OpenVPN OHP 8080
cat > /etc/systemd/system/openvpn-ohp.service << END
[Unit]]
Description=OpenVPN OHP Redirection Service
Documentation=https://t.me/zerossl
After=network.target nss-lookup.target

[Service]
Type=simple
User=root
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
NoNewPrivileges=true
ExecStart=/usr/local/bin/ohpserver -port 8080 -proxy 127.0.0.1:3128 -tunnel 127.0.0.1:700
Restart=on-failure
LimitNOFILE=infinity

[Install]
WantedBy=multi-user.target
END

systemctl daemon-reload
systemctl enable ssh-ohp
systemctl restart ssh-ohp
systemctl enable dropbear-ohp
systemctl restart dropbear-ohp
systemctl enable openvpn-ohp
systemctl restart openvpn-ohp
#------------------------------
printf 'INSTALLATION COMPLETED !\n'
sleep 0.5
printf 'CHECKING LISTENING PORT\n'
if [ -n "$(ss -tupln | grep ohpserver | grep -w 8181)" ]
then
	echo 'SSH OHP Redirection Running'
else
	echo 'SSH OHP Redirection Not Found, please check manually'
fi
sleep 0.5
if [ -n "$(ss -tupln | grep ohpserver | grep -w 8282)" ]
then
	echo 'Dropbear OHP Redirection Running'
else
	echo 'Dropbear OHP Redirection Not Found, please check manually'
fi
sleep 0.5
if [ -n "$(ss -tupln | grep ohpserver | grep -w 8080)" ]
then
	echo 'OpenVPN OHP Redirection Running'
else
	echo 'OpenVPN OHP Redirection Not Found, please check manually'
fi
sleep 0.5
