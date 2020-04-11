#!/bin/bash 

# Terminate current bars

killall -q polybar

# Wait for termination

while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

if type "xrandr"; then
	for m in $(xrandr -q |grep " connected" | cut -d" " -f1); do
		MONITOR=$m polybar --reload config &
	done
else
	polybar --reload config &
fi

#Launch

polybar config && echo "Launching Polybars..." || echo "Crashed"


