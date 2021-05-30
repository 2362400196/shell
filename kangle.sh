#!/bin/bash
echo "1.彩虹kangle"
echo "2.其他kange"
read -p "请选择：" kl
if [ $kl == '1' ]; then
    echo "脚本开始"
    yum -y install wget
    wget http://kangle.odata.cc/start
    sh start
elif [ $kl == '2' ]; then
    echo "其他kangle"
fi
