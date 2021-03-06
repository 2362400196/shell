#!/bin/bash
clear
echo "配置很简单，但是你需要看一些说明，不然肯定会出错，请浏览器访问网址：https://qn.qingningz.cn/index.php/archives/46/"
read -p "看完说明后请回车："
file="/backup/config.ini"
if [ ! -f "$file" ]; then
    cd /
    echo "检测到您没有进行配置，请先配置相关选项"
    pip3 install requests -i https://mirrors.aliyun.com/pypi/simple
    pip3 install -U cos-python-sdk-v5 -i https://mirrors.aliyun.com/pypi/simple
    clear
    echo "检测到你是第一次使用，现在开始做一些配置，务必输入正确"
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
        " >/backup/config.ini
fi

echo "检测到您已经配置好了对象存储，现在开始直接备份"
cd /backup
wget -q https://github.com/2362400196/shell/raw/main/kangle.py -O kangle.py
chmod a+x kangle.py
python3 /backup/kangle.py
echo "cd /backup
python3 kangle.py" >/root/bf.sh
chmod a+x /root/bf.sh
crontab -r
echo "59 23 * * * /root/bf.sh >>bf.log" >>/var/spool/cron/root
clear
echo "已经设置了每天24点准时备份，如需重新备份请删除backup目录下的config.ini配置文件"
