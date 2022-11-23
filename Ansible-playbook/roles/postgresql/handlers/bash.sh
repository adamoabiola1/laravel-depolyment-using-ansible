#!/usr/bin/bash



sudo apt update && sudo apt upgrade -y
sudo apt install wget ca-certificates
sudo wget --quite -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ $(lsb_release -cs)-pgdg main" >> /etc/apt/sources.list.d/pgdg.list'
sudo apt install -y gnupg2
sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
sudo wget --quite -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
update APT Cache
sudo apt -y update
sudo apt -y install postgresql-15
sudo apt install postgresql postgresql-contrib -y
sudo apt install postgresql postgresql-client -y
sudo systemctl start postgresql.service
sudo -i -u postgres psql -c "CREATE DATABASE laravel WITH ENCODING 'UTF8' TEMPLATE template0;"
sudo -i -u postgres psql -c "CREATE USER laravel WITH ENCRYPTED PASSWORD 'laravel';"
sudo -i -u postgres psql -c "GRANT ALL PRIVILEGES ON DATABASE laravel to laravel;"
cd /
sudo -i -u postgres psql -c "ALTER user postgres WITH PASSWORD 'postgres'"
sudo systemctl restart postgresql