#!/bin/bash

# Configuration
WARNING_LEVEL=30
CRITICAL_LEVEL=10
BATTERY_PATH="/sys/class/power_supply/BAT0"

# State flags to prevent notification spam
is_notified_warning=false
is_notified_critical=false

while true; do
  if [ -d "$BATTERY_PATH" ]; then
    capacity=$(cat "$BATTERY_PATH/capacity")
    status=$(cat "$BATTERY_PATH/status")

    # If charging, reset the notification flags
    if [ "$status" = "Charging" ] || [ "$status" = "Full" ]; then
      is_notified_warning=false
      is_notified_critical=false
    else
      # Critical Level
      if [ "$capacity" -le "$CRITICAL_LEVEL" ] && [ "$is_notified_critical" = false ]; then
        notify-send -u critical "Battery Critical" "Battery is at ${capacity}%! Plug in now." -i battery-caution
        is_notified_critical=true
        is_notified_warning=true

      # Warning Level
      elif [ "$capacity" -le "$WARNING_LEVEL" ] && [ "$capacity" -gt "$CRITICAL_LEVEL" ] && [ "$is_notified_warning" = false ]; then
        notify-send -u normal "Battery Warning" "Battery is low (${capacity}%)." -i battery-low
        is_notified_warning=true
      fi
    fi
  fi
  sleep 60
done
