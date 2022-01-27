#!/bin/bash
clear
rm -rf qingning
mkdir qingning
cd qingning
echo "欢迎使用青柠Linux脚本"
echo "1.安装宝塔"
echo "2.kangle工具箱"
echo "3.一键安装网站"
echo "4.服务器环境配置"
echo "5.更多功能"
read -p "请选择：" input1
#安装宝塔
if [ $input1 == '1' ]; then
    clear
    wget https://raw.githubusercontent.com/2362400196/shell/main/bt.sh -O bt.sh && sh bt.sh
#安装kangle
elif [ $input1 == '2' ]; then
    clear
    echo "1.kangle脚本合集"
    echo "2.kangle模板合集"
    echo "3.kangle自动备份至腾讯云对象存储"
    read -p "请选择：" jb
    if [ $jb == '1' ]; then
        wget https://raw.githubusercontent.com/2362400196/shell/main/kangle.sh -O kangle.sh && sh kangle.sh
    elif [ $jb == '2' ]; then
        wget https://raw.githubusercontent.com/2362400196/shell/main/kanglemoban.sh -O kanglemoban.sh && sh kanglemoban.sh

    elif [ $jb == '3' ]; then
        wget https://raw.githubusercontent.com/2362400196/shell/main/bfkangle.sh -O bfkangle.sh && sh bfkangle.sh
      
    fi
#安装网站
elif [ $input1 == '3' ]; then
    clear
    wget https://raw.githubusercontent.com/2362400196/shell/main/webinstall.sh -O webinstall.sh && sh webinstall.sh
  
#服务器环境配置
elif [ $input1 == '4' ]; then
    clear
    wget https://raw.githubusercontent.com/2362400196/shell/main/linux_.sh -O linux_.sh && sh linux_.sh

#开发中
elif [ $input1 == '5' ]; then
    clear
    wget https://raw.githubusercontent.com/2362400196/shell/main/v2.sh -O v2.sh && sh v2.sh
 #开发中
elif [ $input1 == '5' ]; then
    clear
    echo "开发中"
else
    echo "没有符合的条件"
fi
