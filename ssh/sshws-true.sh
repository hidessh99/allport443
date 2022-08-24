#!/bin/bash
# modding by wisnucokrosatrio
portdb=`cat /root/log-install.txt | grep -w "PORT DROPBEAR" | cut -d: -f2|sed 's/ //g' | cut -f2 -d","`
portdb2=`cat /root/log-install.txt | grep -w "PORT DROPBEAR" | cut -d: -f2|sed 's/ //g' | cut -f1 -d","`
portsshws=`cat /root/log-install.txt | grep -w "WEBSOCKET NON TLS" | cut -d: -f2 | awk '{print $1}'`
portsshwstls=`cat /root/log-install.txt | grep -w "WEBSOCKET TLS" | cut -d: -f2 | awk '{print $1}'`
portovpnws=`cat /root/log-install.txt | grep -w "OVPN WEBSOCKET NON TLS" | cut -d: -f2 | awk '{print $1}'`
portovpnwstls=`cat /root/log-install.txt | grep -w "OVPN WEBSOCKET TLS" | cut -d: -f2 | awk '{print $1}'`
portovpntcp=`cat /root/log-install.txt | grep -w "OVPN TCP" | cut -d: -f2 | awk '{print $1}'`

tmux new-session -d -s sshws "node /usr/bin/proxy3.js -dport $portdb -mport $portsshws -o /root/sshws.log"
tmux new-session -d -s ovpnws "node /usr/bin/proxy3.js -dport $portovpntcp -mport $portovpnws -o /root/sshws.log"
tmux new-session -d -s sshwsssl "node /usr/bin/proxy3.js -dport $portdb -mport 700"
tmux new-session -d -s ovpnwsssl "node /usr/bin/proxy3.js -dport $portovpntcp -mport 600"

