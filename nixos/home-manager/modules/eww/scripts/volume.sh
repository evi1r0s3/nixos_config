#!/bin/sh
# 得到当前音量
get_volume() {
    #volume=$(pactl get-sink-volume @DEFAULT_SINK@ | awk -F '/' '{ print $2 }' | sed -e 's/%//')
    # pamixer --get-volume
    wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print $2}' | awk '{printf "%2.0f\n", 100 * $1}'
}
get_mic_volume() {
    # pamixer --get-volume --default-source
    wpctl get-volume @DEFAULT_AUDIO_SOURCE@ | awk '{print $2}' | awk '{printf "%2.0f\n", 100 * $1}'
}
# 得到是否静音
get_mute() {
    # pamixer --get-mute
    wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print $3}'
}
get_mic_mute() {
    # pamixer --get-mute --default-source
    wpctl get-volume @DEFAULT_AUDIO_SOURCE@ | awk '{print $3}'
}
# 渲染图标
get_icon() {
    current="$(get_volume)"
    if [ "$(get_mute)" = "false" ] || [ "$(get_mute)" = "" ]; then
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
    if [ "$(get_mic_mute)" = "false" ] || [ "$(get_mic_mute)" = "" ]; then
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
    #pamixer --toggle-mute
    wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
}
set_mic_mute() {
    # 打开键盘静音灯
    brightnessctl -d platform::micmute set 1 > /dev/null
    #pamixer --toggle-mute --default-source
    wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle
}
# 增加音量
add_volume() {
    #pamixer --unmute && pamixer --increase 5
    wpctl set-mute @DEFAULT_AUDIO_SINK@ 0 && wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+
}
add_mic_volume() {
    #pamixer --unmute --default-source && pamixer --default-source --increase 5
    wpctl set-mute @DEFAULT_AUDIO_SOURCE@ 0 && wpctl set-volume @DEFAULT_AUDIO_SOURCE@ 5%+
}
# 减少音量
sub_volume() {
    # pamixer --unmute && pamixer --decrease 5
    wpctl set-mute @DEFAULT_AUDIO_SINK@ 0 && wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
}
sub_mic_volume() {
    # pamixer --unmute --default-source && pamixer --default-source --decrease 5
    wpctl set-mute @DEFAULT_AUDIO_SOURCE@ 0 && wpctl set-volume @DEFAULT_AUDIO_SOURCE@ 5%-
    
}
set_volume() {
    wpctl set-mute @DEFAULT_AUDIO_SINK@ 0 && wpctl set-volume @DEFAULT_AUDIO_SINK@ "$1"%
}
set_mic_volume() {
    wpctl set-mute @DEFAULT_AUDIO_SOURCE@ 0 && wpctl set-volume @DEFAULT_AUDIO_SOURCE@ "$1"%
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
elif [ "$1" = "--set-mute" ]; then
    set_mute
elif [ "$1" = "--set-mic-mute" ]; then
    set_mic_mute
elif [ "$1" = "--add-volume" ]; then
    add_volume
elif [ "$1" = "--add-mic-volume" ]; then
    add_mic_volmue
elif [ "$1" = "--sub-volmue" ]; then
    sub_volume
elif [ "$1" = "--sub-mic-volume" ]; then
    sub_mic_volume
elif [ "$1" = "--set-volume" ]; then
    set_volume $2
elif [ "$1" = "--set-mic-volume" ]; then
    set_mic_volume $2
else
    get_mute
fi
