### Alpine container with nginx and php 

FROM alpine:latest
MAINTAINER Evgeniy Shumilov <evgeniy.shumilov@gmail.com>

ADD entry.sh /usr/local/bin

RUN apk update && apk add nginx php5-fpm php5-json php5-gd php5-mysqli php5-pdo_mysql php5-dom php5-curl php5-mcrypt php5-pcntl php5-posix php5-openssl curl
RUN mkdir /tmp/client_body && mkdir /tmp/fastcgi_temp && chown -R nobody:nobody /var/www && chown nobody:nobody /tmp/* && chmod +x /usr/local/bin/entry.sh

ADD nginx.conf /etc/nginx

WORKDIR /var/www

ENV PS1='$([ `whoami` == root ] && echo "\\[\\e[1;31m\\]" || "\\[\\e[1;32m\\]")\u\[\e[1;33m\]@\[\e[1;32m\]\h \[\e[1;33m\][\[\e[1;36m\]$([ $? -eq 0 ] && echo "\\[\\e[1;32m\\]$?" || echo "\\[\\e[1;31m\\]$?")\[\e[1;33m\]]\[\e[0;33m\]:\[\e[1;33m\][\[\e[1;34m\]\t\[\e[1;33m\]]\[\e[0;33m\]:\[\e[1;33m\][\[\e[1;36m\]\w\[\e[1;33m\]\\[\e[1;33m\]]\[\e[1;31m\]$([ `whoami` == root ] && echo "\\[\\e[1;31m\\]" || "\\[\\e[1;32m\\]")\$ \[\e[0m\]'

EXPOSE 80
ENTRYPOINT /usr/local/bin/entry.sh

