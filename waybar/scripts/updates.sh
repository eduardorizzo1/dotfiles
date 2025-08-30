#!/usr/bin/env bash
set -Eeuo pipefail

get_repo_updates() {
	if command -v checkupdates >/dev/null; then
		checkupdates 2>/dev/null | wc -l
	else
		pacman -Qu 2>/dev/null | wc -l
	fi
}

get_aur_updates() {
	if command -v paru >/dev/null; then
		paru -Qua 2>/dev/null | wc -l
	elif command -v yay >/dev/null; then
		yay -Qua 2>/dev/null | wc -l
	else
		echo 0
	fi
}

repo=$(get_repo_updates)
aur=$(get_aur_updates)
total=$((repo + aur))

if ((total > 0)); then
	echo "{\"text\":\" $total\",\"tooltip\":\"Repo: $repo • AUR: $aur\",\"class\":\"has\"}"
else
	echo "{\"text\":\" 0\",\"tooltip\":\"Tudo atualizado\",\"class\":\"zero\"}"
fi
