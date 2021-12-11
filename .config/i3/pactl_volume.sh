#!/bin/bash
# picked up from https://www.reddit.com/r/i3wm/comments/a0mgqn/how_can_i_make_my_volume_keys_work_for_both_the/

SINK=$(pacmd list-sinks | grep "index:" | grep '*' | awk '{print $3}')
SOURCE=$(pacmd list-sources | grep "\* index:" | cut -d' ' -f5)

echo $SINK
if [ "$1" == "out" ]; then
  DEVICE=$SINK
else
  DEVICE=$SOURCE
fi

echo $DEVICE

if [ "$1" == "out" ]; then
  if [ "$2" != "M" ]; then
    pactl set-sink-volume "$SINK" "$2"
  else
    pactl set-sink-mute "$SINK" toggle
  fi
else
  if [ "$2" != "M" ]; then
    pactl set-source-volume "$SOURCE" "$2"
  else
    pactl set-source-mute "$SOURCE" toggle
  fi
fi

