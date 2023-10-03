#!/bin/bash

# Update package list and install required packages
sudo apt update
sudo apt install -y python3-pip nginx git postgresql postgresql-contrib

# Clone your GitHub repository
git clone https://github.com/korykilpatrick/aichetype.git ~/aichetype
cd ~/aichetype

# Install Python dependencies
pip3 install -r requirements.txt

# Set up PostgreSQL
sudo -i -u postgres psql -c "CREATE USER numinousloop WITH PASSWORD 'plumbus';"
sudo -i -u postgres psql -c "CREATE DATABASE numinousloop;"
sudo -i -u postgres psql -c "GRANT ALL PRIVILEGES ON DATABASE numinousloop TO numinousloop;"
sudo -i -u postgres psql -c "ALTER USER numinousloop WITH SUPERUSER;"

# Seed the database (Optional)
# psql -U numinousloop -d numinousloop < /path/to/your/seed/file.sql

# Install and run Gunicorn
pip3 install gunicorn
nohup gunicorn -w 4 run:app &

# Set up Nginx
echo 'server {
    listen 80;
    server_name ec2-18-207-208-95.compute-1.amazonaws.com;

    location / {
        proxy_pass http://127.0.0.1:8000;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
    }
}' | sudo tee /etc/nginx/sites-available/aichetype

sudo ln -s /etc/nginx/sites-available/aichetype /etc/nginx/sites-enabled
sudo nginx -t
sudo systemctl restart nginx

# Open Firewall (Optional)
# sudo ufw allow 'Nginx Full'

# Done
echo "Setup complete."
