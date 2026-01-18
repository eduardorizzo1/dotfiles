#!/usr/bin/env sh

ITEM="${NAME:-cpu}"

CPU="$(ps -A -o %cpu | awk 'NR>1 {s+=$1} END {printf "%.0f", s}')"

CORES="$(sysctl -n hw.ncpu 2>/dev/null || echo 1)"
CPU_NORM="$(awk -v c="$CPU" -v n="$CORES" 'BEGIN {printf "%.0f", c/n}')"

sketchybar --set "$ITEM" label="${CPU_NORM}%"
