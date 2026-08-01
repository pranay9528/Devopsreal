#!/bin/bash
set -e

export DEBIAN_FRONTEND=noninteractive

apt-get update -y
apt-get install -y nginx git

cd /home/ubuntu

git clone https://github.com/pranay9528/Devopsreal.git

cp /home/ubuntu/Devopsreal/terraform-project-asg/website/index.html /var/www/html/index.html

systemctl enable nginx
systemctl restart nginx