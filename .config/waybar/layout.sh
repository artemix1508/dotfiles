#!/bin/sh
win=$(hyprctl activewindow -j 2>/dev/null)
if [ "$(echo "$win" | jq -r '.floating // false')" = "true" ]; then
  echo "><>"
elif [ "$(echo "$win" | jq -r '.fullscreen // 0')" != "0" ]; then
  echo "[M]"
else
  echo "[]="
fi