#!/bin/bash

while true; do
    charge=$(cat /sys/class/power_supply/BAT1/capacity)
    adapter=$(cat /sys/class/power_supply/ACAD/online)

    if [ "$adapter" -eq 1 ] && [ "$charge" -ge 85 ]; then
        notify-send "Battery Charge: $charge%" "Unplug the charger!"
    elif [ "$adapter" -eq 0 ] && [ "$charge" -lt 40 ]; then
        notify-send "Battery Charge: $charge%" "Plug in the charger!"
    fi

    sleep 60
done
