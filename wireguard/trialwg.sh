#!/bin/bash
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
#########################
MYIP=$(curl -sS ipv4.icanhazip.com)

clear
# Load params
WgTrial=tes`</dev/urandom tr -dc A-Z0-9 | head -c4`
Hariii=1
source /etc/wireguard/params
source /var/lib/wisnucs/ipvps.conf
if [[ "$IP" = "" ]]; then
SERVER_PUB_IP=$(curl -sS ifconfig.me);
else
SERVER_PUB_IP=$IP
fi
    echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
    echo -e "\E[44;1;39m       ⇱ TRIAL WG ACCOUNT ⇲        \E[0m"
    echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"

	until [[ ${WgTrial} =~ ^[a-zA-Z0-9_]+$ && ${CLIENT_EXISTS} == '0' ]]; do
		#read -rp "Client name: " -e WgTrial
		CLIENT_EXISTS=$(grep -w $WgTrial /etc/wireguard/wg0.conf | wc -l)

		if [[ ${CLIENT_EXISTS} == '1' ]]; then
            echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
            echo -e "\E[44;1;39m       ⇱ TRIAL WG ACCOUNT ⇲        \E[0m"
            echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
			echo ""
			echo "A client with the specified name was already created, please choose another name."
			echo ""
			echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
			echo ""
		    read -n 1 -s -r -p "Press any key to back on menu"
            wg-menu
		fi
	done

	echo "IPv4 Detected"
	ENDPOINT="$SERVER_PUB_IP:$SERVER_PORT"
	WG_CONFIG="/etc/wireguard/wg0.conf"
	LASTIP=$( grep "/32" $WG_CONFIG | tail -n1 | awk '{print $3}' | cut -d "/" -f 1 | cut -d "." -f 4 )
	if [[ "$LASTIP" = "" ]]; then
	CLIENT_ADDRESS="10.11.11.2"
	else
	CLIENT_ADDRESS="10.11.qq.$((LASTIP+1))"
	fi

	# Adguard DNS by default
	CLIENT_DNS_1="1.1.1.1"

	CLIENT_DNS_2="1.0.0.1"
	MYIP2=$(curl -sS ifconfig.me);
	#read -p "Expired (days): " Hariii
	exp=`date -d "$Hariii days" +"%Y-%m-%d"`

	# Generate key pair for the client
	CLIENT_PRIV_KEY=$(wg genkey)
	CLIENT_PUB_KEY=$(echo "$CLIENT_PRIV_KEY" | wg pubkey)
	CLIENT_PRE_SHARED_KEY=$(wg genpsk)

	# Create client file and add the server as a peer
	echo "[Interface]
PrivateKey = $CLIENT_PRIV_KEY
Address = $CLIENT_ADDRESS/24
DNS = $CLIENT_DNS_1,$CLIENT_DNS_2

[Peer]
PublicKey = $SERVER_PUB_KEY
PresharedKey = $CLIENT_PRE_SHARED_KEY
Endpoint = $ENDPOINT
AllowedIPs = 0.0.0.0/0,::/0" >>"$HOME/$SERVER_WG_NIC-client-$WgTrial.conf"

	# Add the client as a peer to the server
	echo -e "### Client $WgTrial $exp
[Peer]
PublicKey = $CLIENT_PUB_KEY
PresharedKey = $CLIENT_PRE_SHARED_KEY
AllowedIPs = $CLIENT_ADDRESS/32" >>"/etc/wireguard/$SERVER_WG_NIC.conf"
	systemctl restart "wg-quick@$SERVER_WG_NIC" > /dev/null 2>&1
	cp $HOME/$SERVER_WG_NIC-client-$WgTrial.conf /home/vps/public_html/$WgTrial.conf
	clear
	sleep 0.5
	echo Generate PrivateKey
	sleep 0.5
	echo Generate PublicKey
	sleep 0.5
	echo Generate PresharedKey
	clear
	echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
    echo -e "\E[44;1;39m       ⇱ TRIAL WG ACCOUNT ⇲        \E[0m"
    echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
	echo -e "Wireguard : http://$MYIP:88/$WgTrial.conf"
	echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
	echo -e "Expired On : $exp"
	echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
   	rm -f /root/wg0-client-$WgTrial.conf
read -n 1 -s -r -p "Press any key to back on menu"

menu
