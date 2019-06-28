#! /bin/bash
focused_window=$(xdotool getactivewindow)


wmctrl -r :ACTIVE: -b remove,maximized_vert,maximized_horz

location=$1
windowX=47.5
windowY=90
tilingright=$(awk "BEGIN{print 100 - $windowX}")
windowname=$(echo $(xdotool getwindowname $focused_window) | awk '{print $NF}')

if [ $location == "left" ]
then

    xdotool windowsize $focused_window $windowX%, $windowY%
    xdotool windowmove $focused_window 1.5%, 5%
    if [ $windowname == "Konsole" ]
    then
        xdotool windowmove --relative $focused_window 0, 24
    fi
fi

if [ $location == "right" ]
then

    xdotool windowsize $focused_window $windowX%, $windowY%
    xdotool windowmove $focused_window $tilingright%, 5%

    if [ $windowname == "Konsole" ]
    then
        xdotool windowmove --relative $focused_window 0, 24
    fi
fi
