#!/usr/bin/env bash

if [[ `hyprctl monitors | grep "Monitor eDP-1" | wc -l` == 0 ]]; then
    hyprctl keyword monitor "eDP-1, preferred, auto, 1"
else
    if [[ `hyprctl monitors | grep "Monitor" | wc -l` != 1 ]]; then
        hyprctl keyword monitor "eDP-1, disable"
    fi
fi
