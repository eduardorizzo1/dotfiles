#!/usr/bin/env sh

ITEM="${NAME:-wifi}"

INFO="$(sudo -n /usr/bin/wdutil info 2>/dev/null)"

RSSI="$(echo "$INFO" | awk '/RSSI/ {print $3}')"
SSID="$(echo "$INFO" | awk '/SSID/ {print $3}')"

if [ -z "$RSSI" ]; then
  sketchybar --set "$ITEM" icon="󰖪"
  exit 0
fi

ICON_EXCELLENT="󰤨"
ICON_GOOD="󰤥"
ICON_OK="󰤢"
ICON_WEAK="󰤟"

if [ "$RSSI" -ge -55 ]; then
  ICON="$ICON_EXCELLENT"
elif [ "$RSSI" -ge -67 ]; then
  ICON="$ICON_GOOD"
elif [ "$RSSI" -ge -75 ]; then
  ICON="$ICON_OK"
else
  ICON="$ICON_WEAK"
fi

sketchybar --set "$ITEM" icon="$ICON"
