#!/bin/sh

/usr/sbin/php-fpm7
chown -R nobody:nobody /var/www/lock
/usr/sbin/nginx

