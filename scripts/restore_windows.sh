#!/bin/bash
sleep 10

# Monitor position
MONITOR_LEFT_X=0
MONITOR_LEFT_Y=0
MONITOR_RIGHT_X=5120
MONITOR_RIGHT_Y=0

wmctrl -lx | grep "chatgpt" | awk '{print $1}' | while read wid; do
  wmctrl -ir $wid -t 0
  xdotool windowmove $wid $MONITOR_RIGHT_X $MONITOR_RIGHT_Y
  wmctrl -ir $wid -b add,maximized_vert,maximized_horz
done

wmctrl -lx | grep "thunar.Thunar" | awk '{print $1}' | while read wid; do
  wmctrl -ir $wid -t 0
  xdotool windowmove $wid $MONITOR_RIGHT_X $MONITOR_RIGHT_Y
  wmctrl -ir $wid -b add,maximized_vert,maximized_horz
done

wmctrl -lx | grep "org.wezfurlong.wezterm.org.wezfurlong.wezterm" | awk '{print $1}' | while read wid; do
  wmctrl -ir $wid -t 0
  xdotool windowmove $wid $MONITOR_LEFT_X $MONITOR_LEFT_Y
  wmctrl -ir $wid -b add,maximized_vert,maximized_horz
done

wmctrl -lx | grep "vesktop.vesktop" | awk '{print $1}' | while read wid; do
  wmctrl -ir $wid -t 1
  xdotool windowmove $wid $MONITOR_RIGHT_X $MONITOR_RIGHT_Y
  wmctrl -ir $wid -b add,maximized_vert,maximized_horz
done

wmctrl -lx | grep "todoist-nativefier-a2ca46.todoist-nativefier-a2ca46" | awk '{print $1}' | while read wid; do
  wmctrl -ir $wid -t 1
  xdotool windowmove $wid $MONITOR_RIGHT_X $MONITOR_RIGHT_Y
  wmctrl -ir $wid -b add,maximized_vert,maximized_horz
done

wmctrl -lx | grep "Navigator.firefox" | awk '{print $1}' | while read wid; do
  wmctrl -ir $wid -t 1
  xdotool windowmove $wid $MONITOR_LEFT_X $MONITOR_LEFT_Y
  wmctrl -ir $wid -b add,maximized_vert,maximized_horz
done

# wmctrl -lx | grep "mastodon-nativefier-389aa3.mastodon-nativefier-389aa3" | awk '{print $1}' | while read wid; do
#   wmctrl -ir $wid -t 4
#   xdotool windowmove $wid $MONITOR_LEFT_X $MONITOR_LEFT_Y
#   wmctrl -ir $wid -b add,maximized_vert,maximized_horz
# done
#
# wmctrl -lx | grep "Mail.thunderbird-esr" | awk '{print $1}' | while read wid; do
#   wmctrl -ir $wid -t 4
#   xdotool windowmove $wid $MONITOR_LEFT_X $MONITOR_LEFT_Y
#   wmctrl -ir $wid -b add,maximized_vert,maximized_horz
# done
#
# wmctrl -lx | grep "obsidian.obsidian" | awk '{print $1}' | while read wid; do
#   wmctrl -ir $wid -t 4
#   xdotool windowmove $wid $MONITOR_LEFT_X $MONITOR_LEFT_Y
#   wmctrl -ir $wid -b add,maximized_vert,maximized_horz
# done
#
