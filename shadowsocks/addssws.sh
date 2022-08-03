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
MYIP=$(wget -qO- ipinfo.io/ip);
domain=$(cat /etc/xray/domain)
wisnuvpn="raw.githubusercontent.com/wisnucokrosatrio/shanum/main/shadowsocks"

source /var/lib/wisnucs/ipvps.conf
if [[ "$IP2" = "" ]]; then
domain=$(cat /etc/xray/domain)
else
domain=$IP2
fi
echo ""
echo "Masukkan Password"
vss="$(cat ~/log-install.txt | grep -w "SHADOWSOCKS V2RAY WS" | cut -d: -f2|sed 's/ //g')"
xss="$(cat ~/log-install.txt | grep -w "SHADOWSOCKS XRAY WS" | cut -d: -f2|sed 's/ //g')"
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${CLIENT_EXISTS} == '0' ]]; do
		read -rp "Password : " -e user
		CLIENT_EXISTS=$(grep -w $user /etc/shadowsocks-rust/config.json | wc -l)

		if [[ ${CLIENT_EXISTS} == '1' ]]; then
			echo ""
			echo -e "Username ${RED}${user}${NC} Already On VPS Please Choose Another"
			exit 1
		fi
	done
read -p "Expired (Days) : " masaaktif
hariini=`date -d "0 days" +"%Y-%m-%d"`
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
cat > /etc/shadowsocks-rust/$user-v2ray.json <<-EOF
{   
    "server":"0.0.0.0",
    "server_port":"50001",
    "service_port":"$vss",
    "password":"$user",
    "timeout":60,
    "method":"none",
    "fast_open":true,
    "no_delay":true,
    "nameserver":"1.1.1.1",
    "mode":"tcp_and_udp",
    "plugin":"v2ray-plugin",
    "plugin_opts":"server;tls;path=/ws;host=$domain;cert=/etc/xray/xray.crt;key=/etc/xray/xray.key;failover=127.0.0.1:443;fast-open"

}
END
cat > /etc/shadowsocks-rust/$user-xray.json <<-EOF
{
    "server":"0.0.0.0",
    "server_port":"50002",
    "service_port":"$xss",
    "password": "gandring",
    "method":"none",
    "fast_open":"true",
    "nameserver":"1.1.1.1",
    "plugin":"xray-plugin",
    "plugin_opts":"server;mode=grpc;tls;host=$domain;cert=/etc/xray/xray.crt;key=/etc/xray/xray.key;failover=127.0.0.1:443;fast-open"
        
}
EOF 
chmod +x /etc/shadowsocks-rust/$user-v2ray.json
chmod +x /etc/shadowsocks-rust/$user-xray.json
echo -e "">>"/etc/shadowsocks-rust/akun.conf"
systemctl enable shadowsocks-rust-server@$user-v2ray.service
systemctl start shadowsocks-rust-server@$user-v2ray.service
systemctl enable shadowsocks-rust-server@$user-xray.service
systemctl start shadowsocks-rust-server@$user-xray.service
tmp1=$(echo -n "aes-256-cfb:${user}@${MYIP}:$vss" | base64 -w0)
tmp2=$(echo -n "aes-256-cfb:${user}@${MYIP}:$xss" | base64 -w0)
linkss1="ss://${tmp1}?plugin=v2ray-plugin;server;tls;path=/ws;host=$domain"
linkss2="ss://${tmp2}?plugin=xray-plugin;server;mode=grpc;tls;host=$domain"
echo -e "### $user $exp
port_v2ray-plugin $vss">>"/etc/shadowsocks-rust/akun.conf"
port_xray-plugin $xss">>"/etc/shadowsocks-rust/akun.conf"
service cron restart
clear
echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\033[1;46m     🔰 AKUN SHADOWSOCKS 🔰       \e[m"   
echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "IP/Host : $MYIP"
echo -e "Domain : $domain"
echo -e "Port V2RAY : $vss"
echo -e "Port XRAY : $xss"
echo -e "Password : $user"
echo -e "Method : aes-256-cfb"
echo -e "Created : $hariini"
echo -e "Expired : $exp"
echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "Link v2ray : $linkss1"
echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "Link xray : $linkss2"
echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\033[1;46m  🔰LUXURY EDITION BY ZEROSSL🔰   \e[m"   
echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
