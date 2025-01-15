#!/bin/bash

while true; do
    charge=$(cat /sys/class/power_supply/BAT1/capacity) #Holds the current battery charge
    adapter=$(cat /sys/class/power_supply/ACAD/online) #Holds the status of the adapter(Charging or not charging)

    if [ "$adapter" -eq 1 ] && [ "$charge" -ge 85 ]; then #If the adapter is plugged in and the battery charge is greater than 85%
        notify-send "Battery Charge: $charge%" "Unplug the charger!"
    elif [ "$adapter" -eq 0 ] && [ "$charge" -lt 40 ]; then #If the adapter is not plugged in and the battery charge is less than 40%
        notify-send "Battery Charge: $charge%" "Plug in the charger!"
    fi

    sleep 120
done
