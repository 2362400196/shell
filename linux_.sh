#!/bin/bash
clear
echo "服务器环境配置"
echo "1.安装python3"
echo "2.安装go环境"
echo "3.linux挂载数据盘"
read -p "请选择：" pz
if [ $pz == '1' ]; then
    echo "脚本开始安装Python3.8"
    yum -y install zlib-devel bzip2-devel openssl-devel ncurses-devel sqlite-devel readline-devel tk-devel gdbm-devel db4-devel libpcap-devel xz-devel libffi-devel
    yum install -y gcc
    wget https://www.python.org/ftp/python/3.8.0/Python-3.8.0a1.tgz
    tar -zxvf Python-3.8.0a1.tgz
    cd Python-3.8.0a1
    ./configure --prefix=/usr/local/python3
    make && make install
    ln -s /usr/local/python3/bin/python3.8 /usr/bin/python3
    ln -s /usr/local/python3/bin/pip3.8 /usr/bin/pip3
    echo "安装完成，请输入python3进行验证"
elif [ $pz == '2' ]; then
    echo "脚本开始"
    yum install golang
    mkdir ~/workspace
    echo 'export GOPATH="$HOME/workspace"' >>~/.bashrc
    ource ~/.bashrc

elif [ $pz == '3' ]; then
    echo "脚本开始"
    echo "挂载脚本开始"
    yum install wget -y && wget -O auto_disk.sh http://download.bt.cn/tools/auto_disk.sh && bash auto_disk.sh
    ource ~/.bashrc
elif [ $pz == '4' ]; then
    echo "脚本开始"

    ource ~/.bashrc
elif [ $pz == '5' ]; then
    echo "脚本开始"

fi
