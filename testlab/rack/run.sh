#!/bin/sh

cd /app
unicorn -c unicorn.rb -D
/usr/local/nginx/sbin/nginx
