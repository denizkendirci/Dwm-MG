#!/bin/bash

xrandr -s 1920x1080 &
xsetroot -name "Mortimer Graves" &
nitrogen --restore &
sxhkd -c /home/mortician/.config/sxhkd/sxhkdrc &
picom -c /home/mortician/.config/picom/picom.conf &

dwm

