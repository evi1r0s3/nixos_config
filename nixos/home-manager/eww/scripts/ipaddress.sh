#!/bin/sh

interface="$(route | grep default | head -n1 | awk '{print $8}')"
lanip=""
for i in $(ip addr | grep "inet "| sed '1d' | awk '{print $2 $NF}' | sed 's/\/[0-9]*/@/g'); do
    lanip="$lanip\n$i"
done

if [ -n "$interface" ]; then
    wan="$(curl -s cip.cc)"
    wanip="$(echo "$wan" | grep "IP" | awk '{print $3}')"
    vendor="$(echo "$wan" | grep "运营商" | awk '{print $3}')"
    addr="$(echo "$wan" | grep "地址" | cut -d ':' -f 2 | sed 's/[[:space:]]//g')"
else
    wanip="No Connection"
    vendor=""
    addr=""
fi

eww update ipaddr="{\"wanip\" : \"$wanip\" ,\"vendor\": \"$vendor\" ,\"addr\": \"$addr\" ,\"lanip\": \"$lanip  \"}"
#echo "{\"wanip\" : \"$wanip\" ,\"vendor\": \"$vendor\" ,\"addr\": \"$addr\" ,\"lanip\": \"$lanip  \"}"
