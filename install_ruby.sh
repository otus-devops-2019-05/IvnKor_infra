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
