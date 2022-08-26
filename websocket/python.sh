#!/bin/bash
# Proxy mod
# wisnucokrosatrio
# ==========================================
# Link Hosting Kalian
wisnuvpn="raw.githubusercontent.com/inoyaksorojawi/large/sae/websocket"

# Getting Proxy Template
wget -q -O /usr/local/bin/tls https://${wisnuvpn}/tls.py
chmod +x /usr/local/bin/tls

# Installing Service
cat > /etc/systemd/system/tls.service << END
[Unit]
Description=SSH WEBSOCKET TLS ROUTING INDONESIA BY ZEROSSL
Documentation=https://t.me/zerossl
After=network.target nss-lookup.target

[Service]
Type=simple
User=root
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
NoNewPrivileges=true
ExecStart=/usr/bin/python -O /usr/local/bin/tls
Restart=on-failure

[Install]
WantedBy=multi-user.target
END

systemctl daemon-reload
systemctl enable tls
systemctl restart tls

# Getting Proxy Template
wget -q -O /usr/local/bin/nontls https://${wisnuvpn}/nontls.py
chmod +x /usr/local/bin/nontls

# Installing Service
cat > /etc/systemd/system/nontls.service << END
[Unit]
Description=SSH WEBSOCKET NON TLS ROUTING INDONESIA BY ZEROSSL
Documentation=https://t.me/zerossl
After=network.target nss-lookup.target

[Service]
Type=simple
User=root
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
NoNewPrivileges=true
ExecStart=/usr/bin/python -O /usr/local/bin/nontls 8880
Restart=on-failure

[Install]
WantedBy=multi-user.target
END

systemctl daemon-reload
systemctl enable nontls
systemctl restart nontls

# Getting Proxy Template
wget -q -O /usr/local/bin/otls https://${wisnuvpn}/otls.py
chmod +x /usr/local/bin/otls
# Installing Service
cat > /etc/systemd/system/otls.service << END
[Unit]
Description=OVPN WEBSOCKET TLS ROUTING INDONESIA BY ZEROSSL
Documentation=https://t.me/zerossl
After=network.target nss-lookup.target

[Service]
Type=simple
User=root
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
NoNewPrivileges=true
ExecStart=/usr/bin/python -O /usr/local/bin/otls 8443
Restart=on-failure

[Install]
WantedBy=multi-user.target
END

systemctl daemon-reload
systemctl enable otls
systemctl restart otls

# Getting Proxy Template
wget -q -O /usr/local/bin/wsovpn https://${wisnuvpn}/wsovpn.py
chmod +x /usr/local/bin/wsovpn

# Installing Service
cat > /etc/systemd/system/wsovpn.service << END
[Unit]
Description=OVPN WEBSOCKET ROTING PENGKOL BY GANDRING
Documentation=https://t.me/zerossl
After=network.target nss-lookup.target

[Service]
Type=simple
User=root
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
NoNewPrivileges=true
ExecStart=/usr/bin/python -O /usr/local/bin/wsovpn 8080
Restart=on-failure

[Install]
WantedBy=multi-user.target
END

systemctl daemon-reload
systemctl enable wsovpn
systemctl restart wsovpn
