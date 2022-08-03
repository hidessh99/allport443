#!/bin/bash
# Proxy For Edukasi & Imclass
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
# Link Hosting Kalian
wisnuvpn="raw.githubusercontent.com/samratu/large/sae/websocket"

# Getting Proxy Template
wget -q -O /usr/local/bin/ws-nontls https://${wisnuvpn}/ws-nontls.py
chmod +x /usr/local/bin/ws-nontls

# Installing Service
cd
cat > /etc/systemd/system/ws-nontls.service << END
[Unit]
Description=SSHWS BENDUNG COLO PENGKOL BY GANDRING
Documentation=https://t.me/zerossl
After=network.target nss-lookup.target

[Service]
Type=simple
User=root
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
NoNewPrivileges=true
ExecStart=/usr/bin/python -O /usr/local/bin/ws-nontls
Restart=on-failure

[Install]
WantedBy=multi-user.target
END

systemctl daemon-reload
systemctl enable ws-nontls
systemctl restart ws-nontls

# Getting Proxy Template
wget -q -O /usr/local/bin/ovpnws https://${wisnuvpn}/ovpnws.py
chmod +x /usr/local/bin/ovpnws

# Installing Service
cat > /etc/systemd/system/ovpnws.service << END
[Unit]
Description=OVPNWS BENDUNG COLO PENGKOL BY GANDRING
Documentation=https://t.me/zerossl
After=network.target nss-lookup.target

[Service]
Type=simple
User=root
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
NoNewPrivileges=true
ExecStart=/usr/bin/python -O /usr/local/bin/ovpnws
Restart=on-failure

[Install]
WantedBy=multi-user.target
END

systemctl daemon-reload
systemctl enable ovpnws
systemctl restart ovpnws

# Getting Proxy Template
wget -q -O /usr/local/bin/ws-tls https://${wisnuvpn}/ws-tls.py
chmod +x /usr/local/bin/ws-tls

# Installing Service
cat > /etc/systemd/system/ws-tls.service << END
[Unit]
Description=SSHWS GAJAH DEMAK BY WISNUCOKROSATRIO
Documentation=https://t.me/zerossl
After=network.target nss-lookup.target

[Service]
Type=simple
User=root
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
NoNewPrivileges=true
ExecStart=/usr/bin/python -O /usr/local/bin/ws-tls
Restart=on-failure

[Install]
WantedBy=multi-user.target
END

systemctl daemon-reload
systemctl enable ws-tls
systemctl restart ws-tls

# Getting Proxy Template
wget -q -O /usr/local/bin/wstunnel https://${wisnuvpn}/wstunnel.py
chmod +x /usr/local/bin/wstunnel

# Installing Service
cat > /etc/systemd/system/wstunnel.service << END
[Unit]
Description=WSTUNNEL BENDUNG COLO PENGKOL BY GANDRING
Documentation=https://t.me/zerossl
After=network.target nss-lookup.target

[Service]
Type=simple
User=root
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
NoNewPrivileges=true
ExecStart=/usr/bin/python -O /usr/local/bin/wstunnel 22
Restart=on-failure

[Install]
WantedBy=multi-user.target
END

systemctl daemon-reload
systemctl enable wstunnel
systemctl restart wstunnel
