#!/bin/bash
# stolen from https://github.com/polybar/polybar/issues/763#issuecomment-450940924
(
  flock 200

  killall -q polybar

  while pgrep -u $UID -x polybar > /dev/null; do sleep 0.5; done

  outputs=$(xrandr --query | grep " connected" | cut -d" " -f1)
  for m in $outputs; do
    export MONITOR=$m
    echo $m
    export TRAY_POSITION=right
    polybar --reload bar1 </dev/null >/var/tmp/polybar-$m.log 2>&1 200>&- &
    disown
  done
) 200>/var/tmp/polybar-launch.lock
