#!/bin/bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Displays
PRIM_DISP='DP-4'
SEC_DISP='DP-2'

# Bars
PRIM_BAR=primbar
SEC_BAR=secbar

# Primary display
if [[ $(xrandr | grep $PRIM_DISP) == *' connected'* ]]; then
  MONITOR=$PRIM_DISP polybar -r $PRIM_BAR &
  echo "Primary display bar launched"
fi

# Secondary Display
if [[ $(xrandr | grep $SEC_DISP) == *' connected'* ]]; then
  MONITOR=$SEC_DISP polybar -r $SEC_BAR &
  echo "Secondary display bar launched"
fi