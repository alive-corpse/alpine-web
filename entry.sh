#!/bin/sh

/usr/bin/php-fpm5
chown -R nobody:nobody /var/www/lock
/usr/sbin/nginx

