from qcloud_cos import CosConfig
from qcloud_cos import CosS3Client
import configparser
import requests
import re
import os
def kangle():
    cf = configparser.SafeConfigParser()
    cf.read("/root/config.ini")
    ip=cf.get("kangle", "ip")
    username = cf.get("kangle", "kanglename")
    pwd = cf.get("kangle", "kanglepwd")
    data={
        'username':username,
        'passwd':pwd
    }
    url='http://'+ip+':3312/admin/index.php?c=session&a=login'
    session = requests.session()
    session.post(url,data=data)
    url2='http://'+ip+':3312/admin/index.php?c=backup&a=backupNow'
    r2 = session.get(url2).text
    # print(r2)
    findlink1 = re.compile(r'"(.*?)&')
    link1 = re.findall(findlink1, r2)
    bf='"'+link1[0]+'&'
    print(bf)
    os.system(bf)
def oss():
    cf = configparser.SafeConfigParser()
    cf.read("/root/config.ini")
    
    secretId = cf.get("kangle", "secretId")
    secretKey = cf.get("kangle", "secretKey")
    Region = cf.get("kangle", "Region")
    Bucket = cf.get("kangle", "Bucket")
    secret_id = secretId  # 替换为用户的 secretId
    secret_key = secretKey  # 替换为用户的 secretKey
    region = Region  # 替换为用户的 地区
    os.system('tar czvf /backup/青柠自动备份.tar.gz *')
    config = CosConfig(Region=region, SecretId=secret_id, SecretKey=secret_key)
    client = CosS3Client(config)
    response = client.upload_file(
        Bucket=Bucket,#存储桶名称
        LocalFilePath='/backup/青柠自动备份.tar.gz',  # 本地文件的路径
        Key='青柠自动备份.tar.gz',  # 上传到桶之后的文件名
        
    )
    print(response['ETag'])
    


kangle()
oss()
