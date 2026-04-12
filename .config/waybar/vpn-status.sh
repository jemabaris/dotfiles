#!/bin/bash

if [ -d /proc/sys/net/ipv4/conf/proton0 ]; then
  SERVER=$(nmcli -t -f NAME,DEVICE connection show --active | grep proton0 | cut -d: -f1)
  # Extract country and server from e.g. "ProtonVPN DE#770"
  COUNTRY=$(echo "$SERVER" | grep -oP '(?<=ProtonVPN )[A-Z]+')
  NUMBER=$(echo "$SERVER" | grep -oP '#\d+')
  echo "{\"text\":\"VPN \",\"class\":\"connected\",\"tooltip\":\"$COUNTRY$NUMBER\"}"
else
  echo '{"text":"VPN ","class":"disconnected","tooltip":"VPN disconnected"}'
fi
