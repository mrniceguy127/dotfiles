#!/bin/bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Displays
PRIM_DISP=$(xrandr --listmonitors | grep '+\*' | cut -d ' ' -f 6 | xargs)
SEC_DISP=$(xrandr --listmonitors | grep -v '+\*' | cut -d ' ' -f 6 | cut -d ' ' -f 1 | xargs)

# Bars
PRIM_BAR_TOP=prim-bar-top
SEC_BAR_TOP=sec-bar-top

PRIM_BAR_BOTTOM=prim-bar-bottom
SEC_BAR_BOTTOM=sec-bar-bottom

# Primary display
if [[ $(xrandr | grep $PRIM_DISP) == *' connected'* ]]; then
  MONITOR=$PRIM_DISP polybar -r $PRIM_BAR_TOP &
  MONITOR=$PRIM_DISP polybar -r $PRIM_BAR_BOTTOM &
  echo "Primary display bar launched"
fi

# Secondary Display
if [[ $(xrandr | grep $SEC_DISP) == *' connected'* ]]; then
  MONITOR=$SEC_DISP polybar -r $SEC_BAR_TOP &
  MONITOR=$SEC_DISP polybar -r $SEC_BAR_BOTTOM &
  echo "Secondary display bar launched"
fi


# Bottom bar
