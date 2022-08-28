#!/bin/bash
# wisnucokrosatrio
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
# ==================================================
# Link Hosting Kalian
wisnuvpn="raw.githubusercontent.com/inoyaksorojawi/large/sae/ssh"

# initialisasi var
export DEBIAN_FRONTEND=noninteractive
OS=`uname -m`;
MYIP=$(wget -qO- ipinfo.io/ip);
MYIP2="s/xxxxxxxxx/$MYIP/g";
ANU=$(ip -o $ANU -4 route show to default | awk '{print $5}');

# Install OpenVPN dan Easy-RSA
apt install openvpn easy-rsa unzip -y
apt install openssl iptables iptables-persistent -y
mkdir -p /etc/openvpn/server/easy-rsa/
cd /etc/openvpn/
wget https://${wisnuvpn}/vpn.zip
unzip vpn.zip
rm -f vpn.zip
chown -R root:root /etc/openvpn/server/easy-rsa/

cd
mkdir -p /usr/lib/openvpn/
cp /usr/lib/x86_64-linux-gnu/openvpn/plugins/openvpn-plugin-auth-pam.so /usr/lib/openvpn/openvpn-plugin-auth-pam.so

# nano /etc/default/openvpn
sed -i 's/#AUTOSTART="all"/AUTOSTART="all"/g' /etc/default/openvpn

# restart openvpn dan cek status openvpn
systemctl enable --now openvpn-server@server-tcp
systemctl enable --now openvpn-server@server-udp
/etc/init.d/openvpn restart
/etc/init.d/openvpn status

# aktifkan ip4 forwarding
echo 1 > /proc/sys/net/ipv4/ip_forward
sed -i 's/#net.ipv4.ip_forward=1/net.ipv4.ip_forward=1/g' /etc/sysctl.conf

# Buat config client TCP 600
cat > /etc/openvpn/GANDRING-TCP.ovpn <<-END
client
dev tun
proto tcp
remote xxxxxxxxx 600
resolv-retry infinite
route-method exe
nobind
persist-key
persist-tun
auth-user-pass
comp-lzo
verb 3
END

sed -i $MYIP2 /etc/openvpn/GANDRING-TCP.ovpn;

# Buat config client UDP 800
cat > /etc/openvpn/GANDRING-UDP.ovpn <<-END
client
dev tun
proto udp
remote xxxxxxxxx 800
resolv-retry infinite
route-method exe
nobind
persist-key
persist-tun
auth-user-pass
comp-lzo
verb 3
END

sed -i $MYIP2 /etc/openvpn/GANDRING-UDP.ovpn;

# Buat config client SSL
cat > /etc/openvpn/GANDRING-SSL-WS.ovpn <<-END
client
dev tun
proto tcp
remote xxxxxxxxx 443
resolv-retry infinite
route-method exe
nobind
persist-key
persist-tun
auth-user-pass
comp-lzo
verb 3
END

sed -i $MYIP2 /etc/openvpn/GANDRING-SSL-WS.ovpn;


# pada tulisan xxx ganti dengan alamat ip address VPS anda 
/etc/init.d/openvpn restart
cd
domain=$(cat /etc/xray/domain)
# masukkan certificatenya ke dalam config client TCP 600
#echo '<ca>' >> /etc/openvpn/GANDRING-TCP.ovpn
#cat /etc/openvpn/server/ca.crt >> /etc/openvpn/GANDRING-TCP.ovpn
#echo '</ca>' >> /etc/openvpn/GANDRING-TCP.ovpn
echo '<ca>' >> /etc/openvpn/GANDRING-TCP.ovpn
cat /root/.acme.sh/$domain_ecc/ca.cer >> /etc/openvpn/GANDRING-TCP.ovpn
echo '</ca>' >> /etc/openvpn/GANDRING-TCP.ovpn

echo '<cert>' >> /etc/openvpn/GANDRING-TCP.ovpn
cat /root/.acme.sh/$domain_ecc/$domain.cer >> /etc/openvpn/GANDRING-TCP.ovpn
echo '</cert>' >> /etc/openvpn/GANDRING-TCP.ovpn

#echo '<key>' >> /etc/openvpn/GANDRING-TCP.ovpn
#cat /etc/openvpn/server/server.key >> /etc/openvpn/GANDRING-TCP.ovpn
#echo '</key>' >> /etc/openvpn/GANDRING-TCP.ovpn
echo '<key>' >> /etc/openvpn/GANDRING-TCP.ovpn
cat /root/.acme.sh/$domain_ecc/$domain.key >> /etc/openvpn/GANDRING-TCP.ovpn
echo '</key>' >> /etc/openvpn/GANDRING-TCP.ovpn

#echo '<tls-auth>' >> /etc/openvpn/GANDRING-TCP.ovpn
#cat /etc/openvpn/server/tls-auth.key >> /etc/openvpn/GANDRING-TCP.ovpn
#echo '</tls-auth>' >> /etc/openvpn/GANDRING-TCP.ovpn

# Copy config OpenVPN client ke home directory root agar mudah didownload ( TCP 600 )
cp /etc/openvpn/GANDRING-TCP.ovpn /home/vps/public_html/GANDRING-TCP.ovpn

# masukkan certificatenya ke dalam config client UDP 800
#echo '<ca>' >> /etc/openvpn/GANDRING-UDP.ovpn
#cat /etc/openvpn/server/ca.crt >> /etc/openvpn/GANDRING-UDP.ovpn
#echo '</ca>' >> /etc/openvpn/GANDRING-UDP.ovpn
echo '<ca>' >> /etc/openvpn/GANDRING-UDP.ovpn
cat /root/.acme.sh/$domain_ecc/ca.cer >> /etc/openvpn/GANDRING-UDP.ovpn
echo '</ca>' >> /etc/openvpn/GANDRING-UDP.ovpn

#echo '<cert>' >> /etc/openvpn/GANDRING-UDP.ovpn
#cat /etc/openvpn/server/server.crt >> /etc/openvpn/GANDRING-UDP.ovpn
#echo '</cert>' >> /etc/openvpn/GANDRING-UDP.ovpn
echo '<cert>' >> /etc/openvpn/GANDRING-UDP.ovpn
cat /root/.acme.sh/$domain_ecc/$domain.cer >> /etc/openvpn/GANDRING-UDP.ovpn
echo '</cert>' >> /etc/openvpn/GANDRING-UDP.ovpn

#echo '<key>' >> /etc/openvpn/GANDRING-UDP.ovpn
#cat /etc/openvpn/server/server.key >> /etc/openvpn/GANDRING-UDP.ovpn
#echo '</key>' >> /etc/openvpn/GANDRING-UDP.ovpn
echo '<key>' >> /etc/openvpn/GANDRING-UDP.ovpn
cat /root/.acme.sh/$domain_ecc/$domain.key >> /etc/openvpn/GANDRING-UDP.ovpn
echo '</key>' >> /etc/openvpn/GANDRING-UDP.ovpn

#echo '<tls-auth>' >> /etc/openvpn/GANDRING-UDP.ovpn
#cat /etc/openvpn/server/tls-auth.key >> /etc/openvpn/GANDRING-UDP.ovpn
#echo '</tls-auth>' >> /etc/openvpn/GANDRING-UDP.ovpn

# Copy config OpenVPN client ke home directory root agar mudah didownload ( UDP 800 )
cp /etc/openvpn/GANDRING-UDP.ovpn /home/vps/public_html/GANDRING-UDP.ovpn

# masukkan certificatenya ke dalam config client SSL 443
#echo '<ca>' >> /etc/openvpn/GANDRING-SSL-WS.ovpn
#cat /etc/openvpn/server/ca.crt >> /etc/openvpn/GANDRING-SSL-WS.ovpn
#echo '</ca>' >> /etc/openvpn/GANDRING-SSL-WS.ovpn
echo '<ca>' >> /etc/openvpn/GANDRING-SSL-WS.ovpn
cat /root/.acme.sh/$domain_ecc/ca.cer >> /etc/openvpn/GANDRING-SSL-WS.ovpn
echo '</ca>' >> /etc/openvpn/GANDRING-SSL-WS.ovpn

#echo '<cert>' >> /etc/openvpn/GANDRING-SSL-WS.ovpn
#cat /etc/openvpn/server/server.crt >> /etc/openvpn/GANDRING-SSL-WS.ovpn
#echo '</cert>' >> /etc/openvpn/GANDRING-SSL-WS.ovpn
echo '<cert>' >> /etc/openvpn/GANDRING-SSL-WS.ovpn
cat /root/.acme.sh/$domain_ecc/$domain.cer >> /etc/openvpn/GANDRING-SSL-WS.ovpn
echo '</cert>' >> /etc/openvpn/GANDRING-SSL-WS.ovpn

#echo '<key>' >> /etc/openvpn/GANDRING-SSL-WS.ovpn
#cat /etc/openvpn/server/server.key >> /etc/openvpn/GANDRING-SSL-WS.ovpn
#echo '</key>' >> /etc/openvpn/GANDRING-SSL-WS.ovpn
echo '<key>' >> /etc/openvpn/GANDRING-SSL-WS.ovpn
cat /root/.acme.sh/$domain_ecc/$domain.key >> /etc/openvpn/GANDRING-SSL-WS.ovpn
echo '</key>' >> /etc/openvpn/GANDRING-SSL-WS.ovpn

echo '<tls-auth>' >> /etc/openvpn/GANDRING-SSL-WS.ovpn
cat /etc/openvpn/server/tls-auth.key >> /etc/openvpn/GANDRING-SSL-WS.ovpn
echo '</tls-auth>' >> /etc/openvpn/GANDRING-SSL-WS.ovpn

# Copy config OpenVPN client ke home directory root agar mudah didownload ( UDP 800 )
cp /etc/openvpn/GANDRING-SSL-WS.ovpn /home/vps/public_html/GANDRING-SSL-WS.ovpn

#firewall untuk memperbolehkan akses UDP dan akses jalur TCP

iptables -t nat -I POSTROUTING -s 10.1.0.0/32 -o $ANU -j MASQUERADE
iptables -t nat -I POSTROUTING -s 10.2.0.0/32 -o $ANU -j MASQUERADE
#iptables -t nat -I POSTROUTING -s 10.3.0.0/32 -o $ANU -j MASQUERADE
#iptables -t nat -I POSTROUTING -s 10.4.0.0/32 -o $ANU -j MASQUERADE
iptables-save > /etc/iptables.up.rules
chmod +x /etc/iptables.up.rules

iptables-restore -t < /etc/iptables.up.rules
netfilter-persistent save
netfilter-persistent reload

# Restart service openvpn
systemctl enable openvpn
systemctl start openvpn
/etc/init.d/openvpn restart

cd /home/vps/public_html/
zip GANDRING.zip GANDRING-TCP.ovpn GANDRING-UDP.ovpn GANDRING-SSL-WS.ovpn > /dev/null 2>&1
cd
cat <<'mySiteOvpn' > /home/vps/public_html/index.html
<!DOCTYPE html>
<html lang="en">

<!-- Simple OVPN Download site -->

<head><meta charset="utf-8" /><title>BENDUNG COLO PENGKOL</title><meta name="description" content="Server" /><meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport" /><meta name="theme-color" content="#000000" /><link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css"><link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet"><link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.8.3/css/mdb.min.css" rel="stylesheet"></head><body><div class="container justify-content-center" style="margin-top:9em;margin-bottom:5em;"><div class="col-md"><div class="view"><img src="https://openvpn.net/wp-content/uploads/openvpn.jpg" class="card-img-top"><div class="mask rgba-white-slight"></div></div><div class="card"><div class="card-body"><h5 class="card-title">Config List</h5><br /><ul class="list-group">

<li class="list-group-item justify-content-between align-items-center" style="margin-bottom:1em;"><p>TCP <span class="badge light-blue darken-4">KONFIG PENAKLUK JANDA</span><br /><small></small></p><a class="btn btn-outline-success waves-effect btn-sm" href="http://IP-ADDRESSS:88/GANDRING-TCP.ovpn" style="float:right;"><i class="fa fa-download"></i> Download</a></li>

<li class="list-group-item justify-content-between align-items-center" style="margin-bottom:1em;"><p>UDP <span class="badge light-blue darken-4">KONFIG PENAKLUK PERAWAN</span><br /><small></small></p><a class="btn btn-outline-success waves-effect btn-sm" href="http://IP-ADDRESSS:88/GANDRING-UDP.ovpn" style="float:right;"><i class="fa fa-download"></i> Download</a></li>

<li class="list-group-item justify-content-between align-items-center" style="margin-bottom:1em;"><p>SSL-WS <span class="badge light-blue darken-4">KONFIG SSL-WS</span><br /><small></small></p><a class="btn btn-outline-success waves-effect btn-sm" href="http://IP-ADDRESSS:88/GANDRING-SSL-WS.ovpn" style="float:right;"><i class="fa fa-download"></i> Download</a></li>

<li class="list-group-item justify-content-between align-items-center" style="margin-bottom:1em;"><p>GANDRING.zip <span class="badge light-blue darken-4">HATI YANG GEMBIRA ADALAH OBAT AWET MUDA</span><br /><small></small></p><a class="btn btn-outline-success waves-effect btn-sm" href="http://IP-ADDRESSS:88/GANDRING.zip" style="float:right;"><i class="fa fa-download"></i> Download</a></li>

</ul></div></div></div></div></body></html>
mySiteOvpn

sed -i "s|IP-ADDRESSS|$(curl -sS ifconfig.me)|g" /home/vps/public_html/index.html

# Delete script
history -c
rm -f /root/vpn.sh
