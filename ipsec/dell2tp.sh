#!/bin/bash
#https://t.me/zerossl
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
date=`date +"%Y-%m-%d" -d "$dateFromServer"`
#########################

clear
export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"

NUMBER_OF_CLIENTS=$(grep -c -E "^### " "/var/lib/wisnucs/data-user-l2tp")
	if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
        echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
        echo -e "\E[46;1;46m      🔰 HAPUS AKUN L2TP 🔰       \E[0m"
        echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
	echo ""
	echo "You have no existing clients!"
	echo ""
	echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
        echo -e "\E[46;1;46m    🔰LUXURY EDITION ZEROSSL🔰    \E[0m"
        echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
        read -n 1 -s -r -p "Tekan Bebas Untuk Ke Menu"
        l2tppmenu
	fi

	echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
        echo -e "\E[46;1;46m      🔰 HAPUS AKUN L2TP 🔰       \E[0m"
        echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
        echo "     No  User.   Expired "
        echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
        grep -E "^### " "/var/lib/wisnucs/data-user-l2tp" | cut -d ' ' -f 2-3 | nl -s ') '
        echo -e "     0) Cancel"
        echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
        echo -e "\E[46;1;46m    🔰LUXURY EDITION ZEROSSL🔰    \E[0m"
        echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"

	until [[ ${CLIENT_NUMBER} -ge 1 && ${CLIENT_NUMBER} -le ${NUMBER_OF_CLIENTS} ]]; do
		if [[ ${CLIENT_NUMBER} == '1' ]]; then
			read -rp "Select one client [1]: " CLIENT_NUMBER
	    elif [[ ${CLIENT_NUMBER} == '0' ]]; then
            l2tppmenu
		else
			read -rp "Select one client [1-${NUMBER_OF_CLIENTS}]: " CLIENT_NUMBER
		fi
	done
	# match the selected number to a client name
	VPN_USER=$(grep -E "^### " "/var/lib/wisnucs/data-user-l2tp" | cut -d ' ' -f2 | sed -n "${CLIENT_NUMBER}"p)
	exp=$(grep -E "^### " "/var/lib/wisnucs/data-user-l2tp" | cut -d ' ' -f3 | sed -n "${CLIENT_NUMBER}"p)
# Delete VPN user
sed -i '/^"'"$VPN_USER"'" l2tpd/d' /etc/ppp/chap-secrets
# shellcheck disable=SC2016
sed -i '/^'"$VPN_USER"':\$1\$/d' /etc/ipsec.d/passwd
sed -i "/^### $VPN_USER $exp/d" /var/lib/wisnucs/data-user-l2tp
# Update file attributes
chmod 600 /etc/ppp/chap-secrets* /etc/ipsec.d/passwd*
clear
echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\E[46;1;46m      🔰 HAPUS AKUN L2TP 🔰       \E[0m"
echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo "✨Nama User ➡️ $user"
echo "✨Kadaluarsa ➡️ $exp"
echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\E[46;1;46m    🔰LUXURY EDITION ZEROSSL🔰    \E[0m"
echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo ""
read -n 1 -s -r -p "Tekan Bebas Untuk Ke Menu"
l2tppmenu
