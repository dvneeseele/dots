#!/bin/bash

# Hardcoded monitor name, because making a separate button widget with eww for each bar on each monitor.
bspc query -T --monitor DP-0 | jq -r '.. | .className? | select(. != null)'
