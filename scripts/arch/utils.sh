#!/usr/bin/env bash

# Audio
yay -S \
  pipewire-pulse \
  pipewire-audio \
  pipewire-jack \
  pipewire-alsa \
  wctl \
  pavucontrol \
  wireplumber \
  pamixer \
  brightnessctl

# Bluetooth
yay -S \
  blueman \
  bluez \
  bluez-utils
