#!/usr/bin/env sh

ITEM="$NAME"
SID="${ITEM#space.}"

ICON_ACTIVE="󰮯"
ICON_DEFAULT="󰊠"
ICON_EMPTY=""

COLOR_ACTIVE=0xff7aa2f7
COLOR_INACTIVE=0xffe0af68
COLOR_EMPTY=0xff565f89

FOCUSED="$(yabai -m query --spaces --space | jq -r '.index' 2>/dev/null)"

WIN_COUNT="$(yabai -m query --windows --space "$SID" | jq 'length' 2>/dev/null)"
WIN_COUNT="${WIN_COUNT:-0}"

if [ "$SID" = "$FOCUSED" ]; then
  ICON="$ICON_ACTIVE"
  COLOR="$COLOR_ACTIVE"
elif [ "$WIN_COUNT" -gt 0 ]; then
  ICON="$ICON_DEFAULT"
  COLOR="$COLOR_INACTIVE"
else
  ICON="$ICON_EMPTY"
  COLOR="$COLOR_EMPTY"
fi

sketchybar --set "$ITEM" \
  icon="$ICON" \
  icon.color="$COLOR" \
  icon.font="Hack Nerd Font:Regular:16.0" \
  icon.padding_right=8 \
  icon.padding_left=8 \
  label.padding_right=8 \
  label.padding_left=8
