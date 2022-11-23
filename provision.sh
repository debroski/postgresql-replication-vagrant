#/bin/sh
sudo yum -y install epel-release vim wget 
# Instalacao postgresql
sudo cat <<EOT >>/etc/yum.repos.d/pgdg.repo
[pgdg13]
name=PostgreSQL 13 for RHEL/CentOS 7 - x86_64
baseurl=https://download.postgresql.org/pub/repos/yum/13/redhat/rhel-7-x86_64
enabled=1
gpgcheck=0
EOT
sudo yum install -y postgresql13-server
sudo yum install -y postgresql13-contrib
sudo yum install -y postgresql13-plperl postgresql13-pltcl

sudo /usr/pgsql-13/bin/postgresql-13-setup initdb

# Iniciando Serviço 
sudo systemctl enable postgresql-13.service
sudo systemctl start postgresql-13.service