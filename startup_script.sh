#!/bin/sh

sudo apt update
sudo apt install -y ruby-full ruby-bundler build-essential

COMMAND='ruby -v'
if $COMMAND | grep -q 'command not found'; then
	echo "error: ruby  installation failuire"
else
	echo "error: ruby  installation successfull"
fi

COMMAND='bundler -v'
if $COMMAND | grep -q 'command not found'; then
	echo "error: bundler installation failuire"
else
	echo "error: bundler installation successfull"
fi

sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927
sudo bash -c 'echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" > /etc/apt/sources.list.d/mongodb-org-3.2.list'

sudo apt update
sudo apt install -y mongodb-org

sudo systemctl start mongod
sudo systemctl enable mongod

COMMAND='sudo systemctl status mongod'
if $COMMAND | grep -q 'active (running)'; then
	echo "mongod is up and running"
else
	echo "mongod is NOT up and NOT running"
fi

cd ~
git clone -b monolith https://github.com/express42/reddit.git
cd ~/reddit
bundle install
puma -d

COMMAND='ps aux'

if $COMMAND | grep -q "[p]uma"; then
	echo "puma app is running"
else
	echo "puma app is NOT running"
fi
