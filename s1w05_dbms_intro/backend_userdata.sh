#!/bin/bash

cd /home/ec2-user

# apply all software updates
yum -y update

# install python3
yum -y install python3

# install git
yum -y install git

# repository for PostgreSQL package
amazon-linux-extras install epel -y
echo "[pgdg13]
name=PostgreSQL 13 for RHEL/CentOS 7 - x86_64
baseurl=https://download.postgresql.org/pub/repos/yum/13/redhat/rhel-7-x86_64
enabled=1
gpgcheck=0
" > /etc/yum.repos.d/pgdg.repo

# PostgreSQL server installation
yum install -y postgresql13 postgresql13-server
/usr/pgsql-13/bin/postgresql-13-setup initdb
systemctl enable --now postgresql-13

# install the boto3 python library (using pip)
pip3 install boto3

# add user accounts

