#!/bin/sh

bat=/sys/class/power_supply/BAT0/
per="$(cat "$bat/capacity")"
status="$(cat "$bat/status")"

if [ "$status" = "Discharging" ]; then
	if [ "$per" -eq "100" ]; then
		icon="󰁹"
	elif [ "$per" -ge "90" ]; then
		icon="󰂂"
	elif [ "$per" -ge "80" ]; then
		icon="󰂁"
	elif [ "$per" -ge "70" ]; then
		icon="󰂀"
	elif [ "$per" -ge "60" ]; then
		icon="󰁿"
	elif [ "$per" -ge "50" ]; then
		icon="󰁾"
	elif [ "$per" -ge "40" ]; then
		icon="󰁽"
	elif [ "$per" -ge "30" ]; then
		icon="󰁼"
	elif [ "$per" -ge "20" ]; then
		icon="󰁻"
	elif [ "$per" -ge "10" ]; then
		icon="󰁺"
	elif [ "$per" -ge "0" ]; then
		icon="󰂎"
	else
		icon="󰂎"
	fi
else
	if [ "$per" -eq "100" ]; then
		icon="󰂅"
	elif [ "$per" -ge "90" ]; then
		icon="󰂋"
	elif [ "$per" -ge "80" ]; then
		icon="󰂊"
	elif [ "$per" -ge "70" ]; then
		icon="󰢞"
	elif [ "$per" -ge "60" ]; then
		icon="󰂉"
	elif [ "$per" -ge "50" ]; then
		icon="󰢝"
	elif [ "$per" -ge "40" ]; then
		icon="󰂈"
	elif [ "$per" -ge "30" ]; then
		icon="󰂇"
	elif [ "$per" -ge "20" ]; then
		icon="󰂆"
	elif [ "$per" -ge "10" ]; then
		icon="󰢜"
	elif [ "$per" -ge "0" ]; then
		icon="󰢟"
	else
		icon="󰢟"
	fi
fi

if [ "$status" = "Charging" ]; then
	charging=" 使用适配器中"

	note="仍需$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep -E "time to full" |
		awk '{print $4$5}' | sed 's/hours/小时/' | sed 's/minutes/分钟/')充满"

elif [ "$status" = "Discharging" ]; then
	charging=" 未连接适配器"

	note="还能使用$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep -E "time to empty" |
		awk '{print $4$5}' | sed 's/hours/小时/' | sed 's/minutes/分钟/')"

elif [ "$status" = "Not charging" ]; then
	charging=" 循环"
	note="未在充电"
elif [ "$status" = "Full" ]; then
	charging=" 已充满"
	note="完全充满"
else
	charging="?"
	note="未知状态"
fi

echo "{\"icon\": \"$icon\", \"charging\": \"$charging\", \"percentage\": \"$per\", \"note\": \"$note\"}"