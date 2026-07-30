#!/bin/bash
set -e
echo "starting deployment..."
cd /home/ubuntu/Devopsreal
git pull
sudo cp terraform-project-asg/website/index.html /var/www/html/index.html
sudo systemctl restart nginx
echo "deployment completed"