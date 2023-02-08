#!/bin/bash
echo "시스템시간 : $(date)"
sudo rm /etc/localtime -v
sleep 0.5

sudo ln -s /usr/share/zoneinfo/Asia/Seoul /etc/localtime -v
sleep 0.5
echo "시스템시간 : $(date)"

sudo yum update -y -v
sleep 1

sudo yum install java-11-amazon-corretto-headless.x86_64 -y
sleep 1

sudo yum install ruby -y -v
sleep 1

TOMCAT_TAR=$(find apache-tomcat*.tar.gz)
if [ -f $TOMCAT_TAR ]; then
tar -zxf $TOMCAT_TAR
sleep 0.5
else
wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.71/bin/apache-tomcat-9.0.71.tar.gz
sleep 0.5
tar -zxf $TOMCAT_TAR
sleep 0.5
fi

TOMCAT_DIR=$(find . -type d -name 'apache*')

sudo mv -f $TOMCAT_DIR /usr/local/tomcat9

sudo ln -s /usr/local/tomcat9/bin/startup.sh ./startup9 -f
sudo ln -s /usr/local/tomcat9/bin/shutdown.sh ./shutdown9 -f

curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
sleep 1

unzip -u awscliv2.zip
sleep 1

sudo ./aws/install
sleep 1

CDA_PID=$(pgrep -f codedeploy)

if [ -z $CDA_PID ]; then
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

#aws s3 ls s3://aws-codedeploy-region-identifier/releases/ | grep '\.rpm$'

sudo ./install auto -v releases/codedeploy-agent-1.4.1-2244.noarch.rpm

sleep 1

# sudo ./install auto

sudo yum update -y -v
sleep 1

echo "CodeDeployAgent + awscliv2 + java11 +tomcat9(+shortcut)"
