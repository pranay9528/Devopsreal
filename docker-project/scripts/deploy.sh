#!/usr/bin/env bash
set -euo pipefail

cd /home/ubuntu/Devopsreal

echo "Deploying KumarStack website..."

sudo install -m 0644 \
  docker-project/website/index.html \
  /var/www/html/index.html

sudo systemctl restart nginx

echo "KumarStack deployment completed successfully."