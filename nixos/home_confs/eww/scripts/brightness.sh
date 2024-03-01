#!/bin/sh

per_intel="$(brightnessctl -m -d intel_backlight | awk -F, '{print substr($4, 0, length($4)-1)}')"

if [ "$per_intel" -eq "100" ]; then
    icon=""
elif [ "$per_intel" -ge "90" ]; then
    icon=""
elif [ "$per_intel" -ge "80" ]; then
    icon=""
elif [ "$per_intel" -ge "70" ]; then
    icon=""
elif [ "$per_intel" -ge "60" ]; then
    icon=""
elif [ "$per_intel" -ge "50" ]; then
    icon=""
elif [ "$per_intel" -ge "40" ]; then
    icon=""
elif [ "$per_intel" -ge "30" ]; then
    icon=""
elif [ "$per_intel" -ge "20" ]; then
    icon=""
elif [ "$per_intel" -ge "10" ]; then
    icon=""
elif [ "$per_intel" -gt "0" ]; then
    icon=""
elif [ "$per_intel" -eq "0" ]; then
    icon=""
fi

echo "$icon"