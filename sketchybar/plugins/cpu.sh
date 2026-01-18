#!/usr/bin/env sh

ITEM="${NAME:-cpu}"

# Pega CPU total do sistema (user+sys), sem precisar sudo
CPU="$(ps -A -o %cpu | awk 'NR>1 {s+=$1} END {printf "%.0f", s}')"

# Em Macs multi-core, esse valor pode passar de 100. Converte para % "normalizado".
CORES="$(sysctl -n hw.ncpu 2>/dev/null || echo 1)"
CPU_NORM="$(awk -v c="$CPU" -v n="$CORES" 'BEGIN {printf "%.0f", c/n}')"

sketchybar --set "$ITEM" label="${CPU_NORM}%"
