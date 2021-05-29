#!/bin/bash
echo "欢迎使用青柠Linux脚本"

echo "1.宝塔控制面板工具箱"
echo "2.kangle工具箱"
echo "3.一键安装网站"
echo "4.服务器环境配置"
echo "5.更多功能"
read -p "请选择：" input1
if [ $input1 == '1' ]; then
    wget https://raw.githubusercontent.com/2362400196/shell/main/bt.sh
    chmod a+x bt.sh
    ./bt.sh
elif [ $input1 == '2' ]; then
    echo "1.kangle脚本合集"
    echo "2.kangle模板合集"
    read -p "请选择：" jb
    if [ $jb == '1' ]; then
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
    elif [ $jb == '2' ]; then
    echo "1.模板1"
        echo "2.模板2"
        read -p "请选择：" mb
        if [ $mb == '1' ]; then
            echo "模板1"
        elif [ $kl == '2' ]; then
            echo "模板2"
        fi



elif [ $input1 == '3' ]; then
    echo "一键安装网站"
    echo "1.网站1"
    echo "2.网站2"
    read -p "请选择：" wz
    if [ $wz == '1' ]; then
      echo "1.网站1"
    elif [ $wz == '2' ]; then
        echo "网站2"
    fi
elif [ $input1 == '4' ]; then
    echo "服务器环境配置"
    echo "1.配置1"
    echo "2.配置2"
    read -p "请选择：" pz
    if [ $pz == '1' ]; then
      echo "1.配置1"
    elif [ $pz == '2' ]; then
        echo "配置2"
        fi
elif [ $input1 == '5' ]; then
    echo "其他kangle"
else
    echo "没有符合的条件"
        fi
    fi
