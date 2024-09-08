#!/bin/sh
# 得到当前音量
get_volume() {
    #volume=$(pactl get-sink-volume @DEFAULT_SINK@ | awk -F '/' '{ print $2 }' | sed -e 's/%//')
    pamixer --get-volume
}
get_mic_volume() {
    pamixer --get-volume --default-source
}
# 得到是否静音
get_mute() {
    pamixer --get-mute
}
get_mic_mute() {
    pamixer --get-mute --default-source
}
# 渲染图标
get_icon() {
    current="$(get_volume)"
    if [ "$(get_mute)" = "false" ]; then
        if [ "$current" -eq "0" ]; then
            echo "󰸈"
        elif [ "$current" -ge "0" ] && [ "$current" -le "25" ]; then
            echo "󰕿"
        elif [ "$current" -ge "25" ] && [ "$current" -le "50" ]; then
            echo "󰖀"
        elif [ "$current" -ge "50" ] && [ "$current" -le "75" ]; then
            echo "󰖀"
        elif [ "$current" -ge "75" ] && [ "$current" -le "100" ]; then
            echo "󰕾"
        fi
    else
        echo "󰸈"
        #echo "󰖁"
    fi
}
get_mic_icon() {
    current="$(get_mic_volume)"
    if [ "$(get_mic_mute)" = "false" ]; then
        if [ "$current" -eq "0" ]; then
	    brightnessctl -d platform::micmute set 1 > /dev/null
            echo "󰍭"
        elif [ "$current" -ge "0" ] && [ "$current" -le "100" ]; then
	    brightnessctl -d platform::micmute set 0 > /dev/null
            echo "󰍬"
        fi
    else
	brightnessctl -d platform::micmute set 1 > /dev/null
        echo "󰍭"
    fi
}
# 开关静音
set_mute() {
    pamixer --toggle-mute
}
set_mic_mute() {
    brightnessctl -d platform::micmute set 1 > /dev/null
    pamixer --toggle-mute --default-source
}
# 增加音量
add_volume() {
    pamixer --unmute && pamixer --increase 5
}
add_mic_volume() {
    pamixer --unmute --default-source && pamixer --default-source --increase 5
}
# 减少音量
sub_volume() {
    pamixer --unmute && pamixer --decrease 5
}
sub_mic_volume() {
    pamixer --unmute --default-source && pamixer --default-source --decrease 5
}
# Execute accordingly
if [ "$1" = "--volume" ]; then
    get_volume
elif [ "$1" = "--icon" ]; then
    get_icon
elif [ "$1" = "--mic-volume" ]; then
    get_mic_volume
elif [ "$1" = "--mic-icon" ]; then
    get_mic_icon
else
    get_volume
fi
