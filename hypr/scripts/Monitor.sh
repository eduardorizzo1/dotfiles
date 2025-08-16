# List monitors
hyprctl monitors | grep 'Monitor' | head -n1 | awk '{print $2}'
