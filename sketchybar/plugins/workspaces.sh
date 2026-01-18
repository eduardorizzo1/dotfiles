#!/usr/bin/env sh

PLUGIN_DIR="$HOME/.config/sketchybar/plugins"

SPACE_ICONS=("1" "2" "3" "4" "5" "6" "7" "8" "9" "10" "11" "12")

sketchybar --remove '/space\..*/' 2>/dev/null
sketchybar --remove spaces 2>/dev/null

SPACE_ITEMS=()

for i in "${!SPACE_ICONS[@]}"; do
  sid="$((i + 1))"
  name="space.$sid"
  SPACE_ITEMS+=("$name")

  space=(
    space="$sid"
    icon="${SPACE_ICONS[i]}"
    icon.padding_left=7
    icon.padding_right=7
    label.drawing=off

    background.drawing=off

    script="$PLUGIN_DIR/space.sh"
    click_script="yabai -m space --focus $sid"
  )

  sketchybar --add space "$name" left --set "$name" "${space[@]}"
done

sketchybar --add bracket spaces "${SPACE_ITEMS[@]}" \
  --set spaces \
    background.drawing=on \
    background.color=0xff1a1b2c \
    background.height=26 \
    background.corner_radius=13 \
    padding_left=6 \
    padding_right=6 \
    margin_left=8 \
    margin_right=8
