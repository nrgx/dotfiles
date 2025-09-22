#!/usr/bin/env bash

THEME="nord"

pkill polybar
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

CONFIG_DIR=$(dirname $0)/$THEME/config.ini
polybar nord -c $CONFIG_DIR &
