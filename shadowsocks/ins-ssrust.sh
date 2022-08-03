#!/bin/bash
cd ~
wisnuvpn="raw.githubusercontent.com/wisnucokrosatrio/shanum/main/shadowsocks"
rm -rf shadowsocks-v* xray-plugin* v2ray-plugin*
lurl='https://api.github.com/repos/shadowsocks/shadowsocks-rust/releases/latest'
latest_version=`curl $lurl| grep tag_name |awk -F '[:,"v]' '{print $6}'`
wget https://github.com/shadowsocks/shadowsocks-rust/releases/download/v${latest_version}/shadowsocks-v${latest_version}.x86_64-unknown-linux-gnu.tar.xz
tar xf shadowsocks-v${latest_version}.x86_64-unknown-linux-gnu.tar.xz -C /usr/local/bin
rm -f shadowsocks-v${latest_version}.x86_64-unknown-linux-gnu.tar.xz

# v2ray-plugin
vurl='https://api.github.com/repos/shadowsocks/v2ray-plugin/releases/latest'
latest_version2=`curl $vurl| grep tag_name |awk -F '[:,"v]' '{print $6}'`
wget https://github.com/shadowsocks/v2ray-plugin/releases/download/v${latest_version2}/v2ray-plugin-linux-amd64-v${latest_version2}.tar.gz
tar xf v2ray-plugin-linux-amd64-v${latest_version2}.tar.gz -C /usr/local/bin
mv /usr/local/bin/v2ray-plugin_linux_amd64 /usr/local/bin/v2ray-plugin
rm -f v2ray-plugin-linux-amd64-v${latest_version2}.tar.gz

# xray-plugin
vurl='https://api.github.com/repos/teddysun/xray-plugin/releases/latest'
latest_version3=`curl $vurl| grep tag_name |awk -F '[:,"v]' '{print $6}'`
wget https://github.com/teddysun/xray-plugin/releases/download/v${latest_version3}/xray-plugin-linux-amd64-v${latest_version3}.tar.gz
tar xf xray-plugin-linux-amd64-v${latest_version3}.tar.gz -C /usr/local/bin
mv /usr/local/bin/xray-plugin_linux_amd64 /usr/local/bin/xray-plugin
rm -f xray-plugin-linux-amd64-v${latest_version3}.tar.gz
wisnuvpn="raw.githubusercontent.com/wisnucokrosatrio/shanum/main/shadowsocks"
# creat configfile-folder
mkdir /etc/shadowsocks-rust >/dev/null 2>&1

# config.json
# grpc has config "serviceName"
domain=$(cat /etc/xray/domain)
cat > /etc/shadowsocks-rust/config.json <<-EOF
{
    "servers": [
        {
            "address": "127.0.0.1",
            "server_port":50001,
            "service_port":2081,
            "password": "gandring",
            "method":"none",
            "fast_open":true,
            "plugin":"v2ray-plugin",
            "plugin_opts":"server;tls;path=/ws;host=$domain;cert=/etc/xray/xray.crt;key=/etc/xray/xray.key"
        },
        {
            "address": "127.0.0.1",
            "server_port":50002,
            "service_port":2082,
            "password": "gandring",
            "method":"none",
            "fast_open":true,
            "plugin":"xray-plugin",
            "plugin_opts":"server;tls;path=/ws;host=$domain;cert=/etc/xray/xray.crt;key=/etc/xray/xray.key"
        }
    ]
}
EOF
chmod +x /etc/shadowsocks-rust/config.json
echo -e "">>"/etc/shadowsocks-rust/akun.conf"

#server
cat > /lib/systemd/system/ssws.service <<-EOF
[Unit]
Description=SHADOWSOCKS WEBSOCKET GAJAH DEMAK
After=network.target
[Service]
Restart=on-abnormal
ExecStart=/usr/local/bin/ssserver -c /etc/shadowsocks-rust/config.json
[Install]
WantedBy=multi-user.target
EOF

iptables -I INPUT -m state --state NEW -m tcp -p tcp --dport 50002 -j ACCEPT
iptables -I INPUT -m state --state NEW -m udp -p udp --dport 50002 -j ACCEPT
iptables -I INPUT -m state --state NEW -m tcp -p tcp --dport 50001 -j ACCEPT
iptables -I INPUT -m state --state NEW -m udp -p udp --dport 50001 -j ACCEPT
iptables -I INPUT -m state --state NEW -m tcp -p tcp --dport 2081 -j ACCEPT
iptables -I INPUT -m state --state NEW -m udp -p udp --dport 2081 -j ACCEPT
iptables -I INPUT -m state --state NEW -m tcp -p tcp --dport 2082 -j ACCEPT
iptables -I INPUT -m state --state NEW -m udp -p udp --dport 2082 -j ACCEPT
iptables -I INPUT -m state --state NEW -m tcp -p tcp --dport 2083 -j ACCEPT
iptables -I INPUT -m state --state NEW -m udp -p udp --dport 2083 -j ACCEPT
iptables-save > /etc/iptables.up.rules
ip6tables-save > /etc/ip6tables.up.rules
systemctl daemon-reload
systemctl stop ssws.service
systemctl start ssws.service
systemctl enable ssws.service
cd /usr/bin
wget -O addssws "https://${wisnuvpn}/addssws.sh"
wget -O delssws "https://${wisnuvpn}/delssws.sh"
wget -O cekssws "https://${wisnuvpn}/cekssws.sh"
wget -O renewssws "https://${wisnuvpn}/renewssws.sh"
chmod +x addssws
chmod +x delssws
chmod +x cekssws
chmod +x renewssws
cd
rm -f /root/ins-ssrust.sh
