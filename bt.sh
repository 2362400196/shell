#!/bin/bash
clear
echo '宝塔脚本'
yum install -y wget && wget -O install.sh http://download.bt.cn/install/install_6.0.sh && sh install.sh
