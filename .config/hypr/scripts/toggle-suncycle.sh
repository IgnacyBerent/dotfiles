#!/bin/bash

SCRIPT_PATH="/home/iberent/.config/hypr/scripts/suncycle.sh"

if pgrep -f "/suncycle.sh$" >/dev/null; then
  pkill -f "/suncycle.sh$"
else
  nohup bash "$SCRIPT_PATH" >/dev/null 2>&1 &
fi
