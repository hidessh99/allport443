#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
MYIP=$(wget -qO- https://icanhazip.com);
DOMAIN=$(wget -qO- https://icanhazip.com);
MYIP=$domain
read -p "Masukan Subdomain Anda :" sub
curl https://get.acme.sh | sh
alias acme.sh=~/.acme.sh/acme.sh
/root/.acme.sh/acme.sh --upgrade --auto-upgrade
/root/.acme.sh/acme.sh --set-default-ca --server letsencrypt
/root/.acme.sh/acme.sh --issue -d "${domain}" --standalone --keylength ec-256
/root/.acme.sh/acme.sh --install-cert -d "${domain}" --ecc \
--fullchain-file /etc/ssl/private/fullchain.pem \
--key-file /etc/ssl/private/privkey.pem
chown -R nobody:nogroup /etc/xray
chown -R nobody:nogroup /etc/ssl/private
chmod 644 /etc/ssl/private/fullchain.pem
chmod 644 /etc/ssl/private/privkey.pem

cp /etc/ssl/private/fullchain.pem /etc/xray/xray.crt
cp etc/ssl/private/privkey.pem /etc/xray/xray.key
