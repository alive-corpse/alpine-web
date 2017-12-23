#!/bin/sh

[ -n "$1" ] && CTNAME="$1" || CTNAME='alpine-web'
docker stop "$CTNAME"
docker rm "$CTNAME"
