#!/bin/bash
echo "1.模板1"
echo "2.模板2"
read -p "请选择：" mb
if [ $mb == '1' ]; then
    echo "模板1"
    cd /vhs/kangle/nodewww/webftp/vhost/view/
    wget -q https://raw.githubusercontent.com/2362400196/shell/main/default2.tar.gz
    tar -zxvf default2.tar.gz
    echo "完成，去kangle后台切换模板为default2，并清理模板缓存"
    chmod a+x kanglemoban.sh
    ./kanglemoban.sh
elif [ $kl == '2' ]; then
    echo "模板2"
fi