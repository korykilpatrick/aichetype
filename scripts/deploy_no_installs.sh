#!/bin/bash

cd /home/ubuntu/aichetype
git pull origin main  # Get new code

npm run build

# Start backend server
nohup python3 run.py > /home/ubuntu/logs/output.log 2>&1 &

# Copy build files to Nginx directory
sudo cp -r dist/* /var/www/html/

# Restart Gunicorn and Nginx
sudo systemctl restart gunicorn
sudo systemctl restart nginx

echo "Deployment complete!"