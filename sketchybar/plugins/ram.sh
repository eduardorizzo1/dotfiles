#!/usr/bin/env sh

ITEM="${NAME:-ram}"

# Total RAM (bytes)
TOTAL_BYTES="$(sysctl -n hw.memsize)"

# Pega páginas livres + inativas do vm_stat (bytes = pages * page_size)
PAGE_SIZE="$(vm_stat | awk '/page size of/ {gsub("\\.", "", $8); print $8}')"

FREE_PAGES="$(vm_stat | awk '/Pages free/ {gsub("\\.", "", $3); print $3}')"
INACTIVE_PAGES="$(vm_stat | awk '/Pages inactive/ {gsub("\\.", "", $3); print $3}')"

FREE_BYTES="$(((FREE_PAGES + INACTIVE_PAGES) * PAGE_SIZE))"
USED_BYTES="$((TOTAL_BYTES - FREE_BYTES))"

USED_PCT="$(awk -v u="$USED_BYTES" -v t="$TOTAL_BYTES" 'BEGIN {printf "%.0f", (u/t)*100}')"

sketchybar --set "$ITEM" label="${USED_PCT}%"
