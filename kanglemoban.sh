#!/bin/bash
clear
echo "1.简洁大气一号模板"
echo "2.模板2"
read -p "请选择：" mb
if [ $mb == '1' ]; then
    echo "模板1"
    cd /vhs/kangle/nodewww/webftp/vhost/view//default
    rm -rf /vhs/kangle/nodewww/webftp/vhost/view/default/*
    wget -q https://github.com/2362400196/shell/raw/main/ep.zip
    unzip ep.zip
    clear
    echo -e "\033[31m 完成，去kangle后台清理模板缓存 \033[0m" 
elif [ $kl == '2' ]; then
    echo "模板2"
fi
