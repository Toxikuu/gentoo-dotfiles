#!/bin/bash

if grep -q "mpv" ~/.config/polybar/config.ini; then
  playerctl -p mpv pause
  sed -i 's/-p mpv/-p spotify/g' ~/.config/polybar/config.ini
  sed -i 's/-p mpv/-p spotify/g' ~/.config/i3/config
  i3-msg reload
  pkill polybar; polybar

elif grep -q "spotify" ~/.config/polybar/config.ini; then
  playerctl -p spotify pause
  sed -i 's/-p spotify/-p mpv/g' ~/.config/polybar/config.ini
  sed -i 's/-p spotify/-p mpv/g' ~/.config/i3/config
  i3-msg reload
  pkill polybar; polybar

else
  echo "wtf"
fi
