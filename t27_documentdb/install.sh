#!/bin/bash
# installer script for MongoDB on shared server

sudo cp mongodb.repo /etc/yum.repos.d

sudo yum -y install mongodb

