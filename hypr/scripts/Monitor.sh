#!/bin/bash

sleep 3

# Compare monitors
actualMonitor=$(hyprctl monitors | grep 'Monitor' | head -n1 | awk '{print $2}')
fileConfigMonitor=$(grep -m1 'monitor=' ~/.config/hypr/monitors.conf | cut -d= -f2- | cut -d, -f1)

if [ "$actualMonitor" != "$fileConfigMonitor" ]; then
	notify-send "   Monitor: The current monitor is different from the config file"
fi
