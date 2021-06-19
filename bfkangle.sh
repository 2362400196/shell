#!/bin/bash
echo "1.配置腾讯对象存储（只需配置一次）"
echo "2.手动上传(同时也自动设置每天12点自动备份至腾讯云)"
read -p "请选择：" tx
if [ $tx = "1" ]; then
    cd /
    pip3 install requests -i https://mirrors.aliyun.com/pypi/simple
    pip3 install -U cos-python-sdk-v5 -i https://mirrors.aliyun.com/pypi/simple
    clear
    echo "现在开始做一些配置，务必输入正确"
    read -p "请输入kangle的IP：" kangleip
    read -p "请输入kangle的管理员账号：" kanglename
    read -p "请输入kangle的管理员密码：" kanglepwd
    echo "开始配置腾讯云对象存储"
    read -p "腾讯云对象存储的secretId：" secretId
    read -p "腾讯云对象存储的secretKey：" secretKey
    read -p "腾讯云对象存储的存储桶地域：" Region
    read -p "腾讯云对象存储的存储桶名称：" Bucket
    echo "
        [kangle]
        ip = $kangleip
        kanglename = $kanglename
        kanglepwd = $kanglepwd
        secretId = $secretId
        secretKey = $secretKey
        Region = $Region
        Bucket = $Bucket

        " >config.ini

elif

    [ $tx = "2" ]
then
    echo "开始备份"
    cd /
    wget -q https://github.com/2362400196/shell/raw/main/kangle.pyc -O kangle.py
    chmod a+x kangle.pyc
    python3 kangle.pyc
    crontab -r
    echo "59 23 * * * /bf.sh >>bf.log" >>/var/spool/cron/root
    echo "已经设置了每天24点准时备份"
fi
