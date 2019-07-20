#!/bin/sh

apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927
bash -c 'echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" > /etc/apt/sources.list.d/mongodb-org-3.2.list'

apt update
apt install -y mongodb-org

systemctl start mongod
systemctl enable mongod

COMMAND='systemctl status mongod'
if $COMMAND | grep -q 'active (running)'; then
	echo "mongod is up and running"
else
	echo "mongod is NOT up and NOT running"
fi


