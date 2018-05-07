terminator &
lastWorkspace=$(wmctrl -d | cut -d' ' -f 1| tail -n1)
wmctrl -s $lastWorkspace
wmctrl -R terminator
#wmctrl -r terminator -b toggle,maximized_vert,maximized_horz
wmctrl -r :ACTIVE -e 0,0,0,1920,1080

