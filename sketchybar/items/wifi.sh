#!/usr/bin/env sh

# ======================================================
# SketchyBar Wi-Fi item
# ======================================================
PLUGIN_DIR="$CONFIG_DIR/plugins"

sketchybar --add item wifi right \
  --set wifi \
  label.drawing=off \
  icon.font="Hack Nerd Font:Regular:15.0" \
  icon.padding_left=8 \
  icon.padding_right=8 \
  icon.color=0xff9ece6a \
  background.drawing=on \
  background.height=26 \
  background.corner_radius=13 \
  background.color=0xff1a1b2c \
  script="$PLUGIN_DIR/wifi.sh" \
  update_freq=5 \
  --subscribe wifi system_woke
