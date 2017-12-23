#!/bin/sh

[ -n "$1" ] && CTNAME="$1" || CTNAME='alpine-web'
cd `dirname "$0"`
docker build -t "$CTNAME" .
docker run -d --name "$CTNAME" -v `pwd`/code:/var/www -p 8080:80 --hostname "$CTNAME" --restart always "$CTNAME"
