#!/bin/bash

cd /home/ubuntu/aichetype
git pull origin main  # Get new code

npm run build

# Copy build files to Nginx directory
sudo cp -r dist/* /var/www/html/

# Restart Gunicorn and Nginx
sudo systemctl restart gunicorn
sudo systemctl restart nginx

echo "Deployment complete!"