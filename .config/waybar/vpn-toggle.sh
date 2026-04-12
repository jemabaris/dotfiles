#!/bin/bash

if [ -d /proc/sys/net/ipv4/conf/proton0 ]; then
  CONNECTION=$(nmcli -t -f NAME,DEVICE connection show --active | grep proton0 | cut -d: -f1)
  nmcli connection down "$CONNECTION"
else
  CONNECTION=$(nmcli -t -f NAME,TYPE connection show | grep wireguard | tail -1 | cut -d: -f1)
  nmcli connection up "$CONNECTION"
fi
