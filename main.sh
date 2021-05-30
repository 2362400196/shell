#!/bin/bash
rm -rf qingning
mkdir qingning
cd qingning
echo "欢迎使用青柠Linux脚本"
echo "1.宝塔控制面板工具箱"
echo "2.kangle工具箱"
echo "3.一键安装网站"
echo "4.服务器环境配置"
echo "5.更多功能"
read -p "请选择：" input1
#安装宝塔
if [ $input1 == '1' ]; then
    wget https://raw.githubusercontent.com/2362400196/shell/main/bt.sh
    chmod a+x bt.sh
    ./bt.sh
#安装kangle
elif [ $input1 == '2' ]; then
    echo "1.kangle脚本合集"
    echo "2.kangle模板合集"
    read -p "请选择：" jb
    if [ $jb == '1' ]; then
    wget https://raw.githubusercontent.com/2362400196/shell/main/kangle.sh
        chmod a+x kangle.sh
        ./kangle.sh
    elif [ $jb == '2' ]; then
    wget https://raw.githubusercontent.com/2362400196/shell/main/kanglemoban.sh
        chmod a+x kanglemoban.sh
        ./kanglemoban.sh
    fi
#安装网站
elif [ $input1 == '3' ]; then
    chmod a+x webinstall.sh
    ./webinstall.sh
#服务器环境配置
elif [ $input1 == '4' ]; then
    chmod a+x linux_.sh
    ./linux_.sh
#开发中
elif [ $input1 == '5' ]; then
    echo "开发中"
else
    echo "没有符合的条件"
fi
