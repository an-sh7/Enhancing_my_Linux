#!/bin/bash

while true; do
    #Get the battery charge and adapter status
    ACPI_OUTPUT=$(acpi -b)

    # Extract the charging/discharging state
    adapter=$(echo "$ACPI_OUTPUT" | awk -F': |, ' '{print $2}')

    # Extract the battery percentage
    charge=$(echo "$ACPI_OUTPUT" | awk -F': |, ' '{print $3}' | tr -d '%')

    if [ "$adapter" == "Charging" ] && [ "$charge" -ge 85 ]; then #If the adapter is plugged in and the battery charge is greater than 85%
        notify-send "Battery Charge: $charge%" "Unplug the charger!"
    elif [ "$adapter" == "Discharging" ] && [ "$charge" -lt 70 ]; then #If the adapter is not plugged in and the battery charge is less than 40%
        notify-send "Battery Charge: $charge%" "Plug in the charger!"
    fi
    sleep 120
done
