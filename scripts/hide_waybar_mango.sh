#!/usr/bin/bash

# startd=$(pgrep waybar)

# if [ -n "$startd" ]; then
#	pkill waybar
#else
#	waybar -c ~/.config/mango/waybar/config.jsonc -s ~/.config/mango/waybar/style.css
#fi
qs -c noctalia-shell ipc call bar toggle
