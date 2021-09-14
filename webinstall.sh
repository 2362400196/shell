#!/bin/bash
clear
echo "一键安装网站"
echo "1.漂亮的发卡网"
echo "2.cloudreve网盘"
read -p "请选择：" wz
#发卡网
if [ $wz == '1' ]; then
    echo "脚本开始"
    echo "首先你需要一些配置，或者观看图文教程：https://www.qingningz.cn/archives/178"
    echo "1.网站创建完成后设置伪静态为
    location / {
        try_files $uri $uri/ /index.php?$query_string;
    }         
        "
    echo "2.PHP 禁用函数  scandir 和putenv ，这里找到这两个点击删除，然后重启php即可"
    echo "3.设置运行目录为/public"
    read -p "全部配置完成后回车安装（有任何问题请加我QQ：2362400196）：" bb

    read -p "你的域名（网站目录名）：" path
    cd ..
    cd ..
    cd www/wwwroot/$path
    wget https://github.com/Tai7sy/card-system/releases/download/3.0/card_release.tar.gz
    tar -zxvf card_release.tar.gz
    cd card_system_free_dist
    mv * ../
    cd ..
    cd ..
    echo "---------------------------"
    echo "开始配置数据库信息"
    read -p "请输入数据库地址：(一般是127.0.0.1)" dizhi
    read -p "请输入数据库端口(一般是3306)：" dk
    read -p "请输入数据库名称：" usname
    read -p "请输入数据库密码：" pwd
    echo "

    DB_CONNECTION=mysql
    DB_HOST=$dizhi
    DB_PORT=$dk
    DB_DATABASE=$usname
    DB_USERNAME=$usname
    DB_PASSWORD=$pwd


    # 下面配置无需修改
    APP_ENV=local
    APP_KEY=base64:I7uriU+LI51MddeWbIH1XZ+r+KqW3C9zhuzMvGSJ57c=
    APP_DEBUG=false
    APP_LOG_LEVEL=error
    APP_LOG=daily

    BROADCAST_DRIVER=log
    CACHE_DRIVER=file
    SESSION_DRIVER=array
    SESSION_LIFETIME=120
    QUEUE_DRIVER=sync

    REDIS_HOST=127.0.0.1
    REDIS_PASSWORD=null
    REDIS_PORT=6379
    " >.env
    sleep 3s

    chmod -R 777 storage/
    chmod -R 777 bootstrap/cache/
    php artisan key:generate
    php artisan migrate:fresh --seed
    php artisan cache:clear
    echo "恭喜你，安装完成"
    echo "======================"
    echo "默认账号密码 admin@qq.com/123456, 请及时修改"
    echo "进入后台 域名/admin"
    echo "======================"

#自建网盘
elif [ $wz == '2' ]; then
    echo "1.安装网盘（尽量提前搭建宝塔，做反代理用，不反代也可以，看你）"
    echo "2.进程守护（必选，退出终端进程就会被杀死）"
    echo "3.切换数据库MySQL（要求5.7版本，可选，不是必须。）"
    read -p "请选择：" wp_1
    if [ $wp_1 = "1" ]; then
        echo "网盘开始安装"
        cd qingning
        wget https://github.com/cloudreve/Cloudreve/releases/download/3.3.2/cloudreve_3.3.2_linux_amd64.tar.gz
        tar -zxvf cloudreve_3.3.2_linux_amd64.tar.gz
        read -p "安装完成，重新执行./webinstall.sh,选择进程守护"
    elif [ $wp_1 = "3" ]; then
        echo "切换MySQL数据库"
        read -p "请输入MySQL地址（一般为127.0.0.1）：" ip
        read -p "请输入MySQL用户名：" user
        read -p "请输入MySQL密码：" pword
        # read -p "请输入MySQL表前缀：" qianzhu
        echo "
        [Database]
        ; 数据库类型，目前支持 sqlite | mysql
        Type = mysql
        ; MySQL 端口
        Port = 3306
        ; 用户名
        User = $user
        ; 密码
        Password = $pword
        ; 数据库地址
        Host = $ip
        ; 数据库名称
        Name = $user
        ; 数据表前缀
        TablePrefix = wp
    
    " >>conf.ini
        systemctl restart cloudreve
        echo "请去数据库里执行sql语句：UPDATE $(zhu).$(wpusers) SET $(password) = 'ojY1sFme6J8qCHIq:a63e21304dc429c4178071359377eed5e0e7c6c6' WHERE $(wpusers).$(id) = 1;"
        read -p "切换完成，请牢记管理员账号密码"
        echo "默认管理员账号：admin@cloudreve.org"
        echo "默认管理员账号：123456"
        echo "现在重启 网盘：chmod +x ./cloudreve
        ./cloudreve"
    elif [ $wp_1 = "3" ]; then
        echo "构建"
        golong
        wget -q https://zhuxiaohuan-1252924679.cos.ap-nanjing.myqcloud.com/shell/nodejs/nodejs -O nodejs && sh nodejs
        wget https://dl.yarnpkg.com/rpm/yarn.repo -O /etc/yum.repos.d/yarn.repo
        yum -y install yarn
        go get github.com/rakyll/statik
        git clone --recurse-submodules https://github.com/cloudreve/Cloudreve.git
        cd Cloudreve
        git checkout 3.3.1

        read -p "完成，任意键返回"
    elif [ $wp_1 = "2" ]; then
        ./cloudreve
        echo "进程守护"
        read -p "请输入程序安装目录" PATH_TO_CLOUDREVE
        echo "
    [Unit]
    Description=Cloudreve
    Documentation=https://docs.cloudreve.org
    After=network.target
    After=mysqld.service
    Wants=network.target

    [Service]
    WorkingDirectory=/$PATH_TO_CLOUDREVE
    ExecStart=/$PATH_TO_CLOUDREVE/cloudreve
    Restart=on-abnormal
    RestartSec=5s
    KillMode=mixed

    StandardOutput=null
    StandardError=syslog

    [Install]
    WantedBy=multi-user.target
    
    " >>/usr/lib/systemd/system/cloudreve.service
        systemctl daemon-reload
        systemctl start cloudreve
        systemctl enable cloudreve
    fi
fi
