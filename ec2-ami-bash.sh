#!/bin/bash
REGION=$(curl 169.254.169.254/latest/meta-data/placement/availability-zone/)
REGION=${REGION%a}
REGION=${REGION%b}
REGION=${REGION%c}
REGION=${REGION%d}
REGION=${REGION%e}
REGION=${REGION%f}
REGION=${REGION%g}
REGION=${REGION%h}
REGION=${REGION%i}
REGION=${REGION%j}
REGION=${REGION%k}
REGION=${REGION%l}
REGION=${REGION%m}
REGION=${REGION%n}
REGION=${REGION%o}
REGION=${REGION%p}
yum update -y
yum install -y httpd24 php70 mysql56-server php70-mysqlnd
yum install ruby wget -y
chmod -R 777 /etc/httpd/
chmod -R 777 /var/www/html/
chmod -R 777 /home/ec2-user/
cd /home/ec2-user
wget https://aws-codedeploy-$REGION.s3.amazonaws.com/latest/install
chmod +x ./install
./install auto
service httpd start
chkconfig httpd on
cd /var/www/html/
echo "I am Healthy" >> health.html
cd /home/ec2-user