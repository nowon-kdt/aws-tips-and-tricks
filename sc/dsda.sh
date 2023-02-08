#!/bin/bash

echo "시작"
sudo ln -vsf /usr/share/zoneinfo/Asia/Seoul /etc/localtime
sleep 0.5
echo "재설정후 시스템 시간 : $(date)"

echo "업데이트 설치"
sudo yum update -y
sleep 0.5

echo "자바11 설치"
sudo yum install java-11-amazon-corretto-headless.x86_64 -y
sleep 0.5

echo "루비 설치"
sudo yum install ruby -y
sleep 0.5

TOMCAT_TAR=$(find . -type f -name 'tomcat9.tar.gz')
if [ -f "$TOMCAT_TAR" ]; then
  echo "$TOMCAT_TAR가 이미 존재합니다."
  sleep 0.5
else
  wget -O tomcat9.tar.gz https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.71/bin/apache-tomcat-9.0.71.tar.gz
  sleep 0.5
fi

mkdir tomcat9 && tar -zxf "$TOMCAT_TAR" -C /home/ec2-user/tomcat9 --strip-components=1
sleep 0.5

TOMCAT_DIR=$(find . -type d -name "*tomcat9*")

# mv -f "$TOMCAT_DIR" /usr/local/tomcat9

# ln -s /usr/local/tomcat9/bin/startup.sh ./startup9
# ln -s /usr/local/tomcat9/bin/shutdown.sh ./shutdown9

if [ -f "/home/ec2-user/awscliv2.zip" ]; then
  echo "File \"/home/ec2-user/awscliv2.zip\" exists"
else
  curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
fi

sleep 1

unzip -u awscliv2.zip
sleep 1

sudo ./aws/install
sleep 1

CDA_PID=$(pgrep -f codedeploy)

if [ -z "$CDA_PID" ]; then
  echo "실행중인 코드 디플로이없음"
  sleep 0.3
else
  echo "실행중인 코드 디플로이 $CDA_PID"
  sleep 0.3
  chmod +x ./dsdaa.sh
  sleep 0.3
  sudo ./dsdaa.sh
  sleep 1
fi

wget https://aws-codedeploy-ap-northeast-2.s3.ap-northeast-2.amazonaws.com/latest/install
sleep 1
chmod +x ./install

aws s3 ls s3://aws-codedeploy-ap-northeast-2/releases/ | grep '\.rpm$'

sudo ./install auto -v releases/codedeploy-agent-1.4.1-2244.noarch.rpm

sleep 1

# sudo ./install auto

sudo yum update -y -v
sleep 1

echo "CodeDeployAgent + awscliv2 + java11 +tomcat9(+shortcut)"
