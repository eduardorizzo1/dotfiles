#!/usr/bin/env bash
set -euo pipefail

read LAT LON < <(curl -s ipinfo.io/loc | tr ',' ' ')
CITY="Sydney"

CACHE="${XDG_CACHE_HOME:-$HOME/.cache}"
MODE_FILE="$CACHE/waybar_weather_show_city"
mkdir -p "$CACHE"

URL="https://api.open-meteo.com/v1/forecast?latitude=$LAT&longitude=$LON&current=temperature_2m,apparent_temperature,weather_code,wind_speed_10m&timezone=auto"
J="$(curl -sf "$URL" || true)"

if [[ -z "$J" ]]; then
	printf '{"text":"❓ --","tooltip":"Sem dados"}\n'
	exit 0
fi

t=$(jq -r '.current.temperature_2m' <<<"$J")
ta=$(jq -r '.current.apparent_temperature' <<<"$J")
w=$(jq -r '.current.wind_speed_10m' <<<"$J")
c=$(jq -r '.current.weather_code' <<<"$J")

case "$c" in
0) ic="☀" ;; 1 | 2) ic="⛅" ;; 3) ic="☁" ;;
45 | 48) ic="🌫" ;; 51 | 53 | 55 | 56 | 57) ic="🌦" ;;
61 | 63 | 65 | 80 | 81 | 82 | 66 | 67) ic="🌧" ;;
71 | 73 | 75 | 77 | 85 | 86) ic="🌨" ;;
95 | 96 | 99) ic="⛈" ;; *) ic="❓" ;;
esac

if [[ -f "$MODE_FILE" ]]; then
	text="$CITY │ $ic $t°C"
else
	text="$ic $t°C"
fi

printf '{"text":"%s","tooltip":"Temp: %s°C (sens.: %s°C)\\nVento: %s km/h"}\n' "$text" "$t" "$ta" "$w"
