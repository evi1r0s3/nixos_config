#!/bin/sh

interface="$(route | grep default | head -n1 | awk '{print $8}')"
str="$(echo "$interface" | cut -c 1-1)"
single="$(cat < /proc/net/wireless | sed -n '3,$p' | grep "$interface" | awk '{print $3}' | tr -d '.')"

if [ "$str" = "w" ]; then
    if [ "$single" -ge "75" ]; then
        icon="󰤨"
        # status="Wifi Connected"
    elif [ "$single" -ge "50" ]; then
        icon="󰤥"
        # status="Wifi Connected"
    elif [ "$single" -ge "25" ]; then
        icon="󰤢"
        # status="Wifi Connected"
    elif [ "$single" -ge "10" ]; then
        icon="󰤟"
        # status="Wifi Connected"
    else
        icon="󰤯"
        # status="Wifi Connected"
    fi
elif [ "$str" = "e" ]; then
    icon="󰈀"
    # status="Eth Connected"
else
    icon="󰶐"
    # status="No connection"
fi
echo $icon
# echo "{\"icon\": \"${icon}\", \"status\": \"${status}\"}"
