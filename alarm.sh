#!/bin/sh

# Play an alarm at a set time
# Joe Standring <git@joestandring.com>
# GNU GPLv3

ALARMSOUND="./alarm.ogg"

for f in /tmp/alarm.*; do
    if [ -e "$f" ]; then
        printf "There may be another instance of this script running. If you are sure there is not, delete the file /tmp/alarm.XXXXX and try again."
    else
        TMP=$(mktemp /tmp/alarm.XXXXX)
        trap 'rm -rf "$TMP"; trap - EXIT; exit' EXIT INT HUP
        
        if [ $# -eq 3 ]; then
            HOU=$1
            MIN=$2
            SEC=$3
        elif [ $# -eq 2 ]; then
            HOU=$1
            MIN=$2
        else
            read -r -p 'Hour (00-23): ' HOU
            read -r -p 'Minuite (00-59): ' MIN
            read -r -p 'Second (00-59): ' SEC
            echo""
        fi

        if [ "$HOU" -gt 23 ]; then
            HOU=23;
        fi
        if [ "$HOU" -lt 0 ]; then
            HOU=0;
        fi
        if [ "$MIN" -gt 59 ]; then
            MIN=59;
        fi
        if [ "$MIN" -lt 0 ]; then
            MIN=0;
        fi
        if [ "$SEC" -gt 59 ]; then
            SEC=59;
        fi
        if [ "$SEC" -lt 0 ]; then
            SEC=0;
        fi

        ALARM=$(printf "%d:%02d:%02d" "$HOU" "$MIN" "$SEC")

        printf "Alarm set for %s" "$ALARM"
        printf "%d:%02d:%02d" "$HOU" "$MIN" "$SEC" >> "$TMP"

        TIMEREACHED=0
        while [ "$TIMEREACHED" -eq 0 ]
        do
            if [ "$ALARM" = "$(date +%H:%M:%S)" ]; then
                TIMEREACHED=1
                notify-send "Alarm time reached!"
                mpv "$ALARMSOUND"
            fi
        done
    fi
done
