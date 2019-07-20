#!/bin/sh

apt update
apt install -y ruby-full ruby-bundler build-essential

ruby -v
echo $?
if [ $? -eq 0 ]; then
        echo "ruby  installation successfull"
else
        echo "error: ruby  installation failed" >&2

fi
