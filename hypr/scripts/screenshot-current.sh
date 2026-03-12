#!/bin/bash

tmpfile=$(mktemp)
time=$(date +"%Y-%m-%d_%H:%M:%S.%3N")
dir="$HOME/Pictures/Screenshots"
file="${time}_Screenshot.png"

grim -c -o "$(hyprctl activeworkspace -j | jq -r '.monitor')" "$tmpfile"
if [[ -s "$tmpfile" ]]; then
wl-copy <"$tmpfile"
mv "$tmpfile" "$dir/$file"
fi
