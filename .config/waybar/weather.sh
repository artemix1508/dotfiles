#!/bin/sh
data=$(curl -sf --max-time 5 "wttr.in/Gdansk?format=%C|%t&m")
[ -z "$data" ] && { echo "󰖐 N/A"; exit 0; }

cond=$(echo "$data" | cut -d'|' -f1 | tr 'A-Z' 'a-z')
temp=$(echo "$data" | cut -d'|' -f2 | tr -d '+ ')

case "$cond" in
  *sunny*|*clear*)            icon="󰖙" ;;
  *partly*)                   icon="󰖕" ;;
  *cloud*|*overcast*)         icon="󰖐" ;;
  *fog*|*mist*)               icon="󰖑" ;;
  *thunder*)                  icon="󰖓" ;;
  *snow*|*sleet*|*blizzard*)  icon="󰖘" ;;
  *rain*|*drizzle*|*shower*)  icon="󰖗" ;;
  *)                          icon="󰖐" ;;
esac

echo "$icon $temp"