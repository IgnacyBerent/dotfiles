#!/bin/bash

get_targets() {
  HOUR=$(date +%H)
  case $HOUR in
  00 | 01 | 02 | 03 | 04 | 05)
    T=2200
    B=0.5
    ;;
  06 | 07)
    T=4000
    B=0.7
    ;;
  08 | 09 | 10 | 11 | 12 | 13)
    T=6500
    B=1.0
    ;;
  14 | 15 | 16 | 17)
    T=6000
    B=1.0
    ;;
  18 | 19)
    T=4500
    B=0.8
    ;;
  20 | 21)
    T=3500
    B=0.7
    ;;
  22 | 23)
    T=2800
    B=0.6
    ;;
  esac
}

while true; do
  get_targets

  busctl --user set-property rs.wl-gammarelay / rs.wl.gammarelay Temperature q "$T"
  busctl --user set-property rs.wl-gammarelay / rs.wl.gammarelay Brightness d "$B"
  sleep 600
done
