#!/bin/bash
# A screenshot all script

tmpfile=$(mktemp)
time=$(date +"%Y-%m-%d_%H:%M:%S.%3N")
dir="$HOME/Pictures/Screenshots"
file="${time}_Screenshot.png"

grim - >"$tmpfile"
if [[ -s "$tmpfile" ]]; then
wl-copy <"$tmpfile"
mv "$tmpfile" "$dir/$file"
fi