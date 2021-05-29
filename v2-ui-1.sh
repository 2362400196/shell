#!/bin/bash
cd /root/
wget https://github.com/2362400196/shell/raw/main/v2-ui-linux.tar.gz
mv v2-ui-linux.tar.gz /usr/local/
cd /usr/local/
tar zxvf v2-ui-linux.tar.gz
rm v2-ui-linux.tar.gz -f
cd v2-ui
chmod +x v2-ui bin
cp -f v2-ui.service /etc/systemd/system/
systemctl daemon-reload
systemctl enable v2-ui
systemctl restart v2-ui
 
curl -o /usr/bin/v2-ui -Ls https://raw.githubusercontent.com/2362400196/shell/main/v2-ui.sh
chmod +x /usr/bin/v2-ui
