#!/usr/bin/env bash

BAT=/sys/class/power_supply/BAT0

if [ -f "$BAT/capacity" ]; then
    CAP=$(cat "$BAT/capacity")
    
    if [ -f "$BAT/status" ]; then
        STATUS=$(cat "$BAT/status")
        
        if [ "$STATUS" = "Charging" ]; then
            echo "+$CAP%"
        elif [ "$STATUS" = "Full" ]; then
            echo "$CAP%"
        else
            echo "$CAP%"
        fi
    else
        echo "$CAP%"
    fi
else
    echo "No battery"
fi
