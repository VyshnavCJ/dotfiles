#!/bin/bash

# Monitor positions
MONITOR_LEFT_X=0
MONITOR_LEFT_Y=0
MONITOR_RIGHT_X=5120
MONITOR_RIGHT_Y=0

# Function to move and maximize a window
move_and_maximize() {
  wid=$1
  x=$2
  y=$3
  workspace=$4

  echo "→ Moving $wid to workspace $workspace at ($x,$y)"
  wmctrl -ir "$wid" -t "$workspace"
  wmctrl -s "$workspace"
  xdotool windowmove "$wid" "$x" "$y"
  wmctrl -ir "$wid" -b add,maximized_vert,maximized_horz
}

# Get initial list of windows
old_list=$(wmctrl -lx | awk '{print $1}')

while true; do
  sleep 1
  new_list=$(wmctrl -lx | awk '{print $1}')
  new_windows=$(comm -13 <(echo "$old_list" | sort) <(echo "$new_list" | sort))

  for wid in $new_windows; do
    entry=$(wmctrl -lx | grep -i "$wid")
    echo "🆕 New window detected: $entry"

    case "$entry" in
      *"chatgpt"*)
        move_and_maximize "$wid" "$MONITOR_RIGHT_X" "$MONITOR_RIGHT_Y" 0
        ;;
      *"thunar.Thunar"*)
        move_and_maximize "$wid" "$MONITOR_RIGHT_X" "$MONITOR_RIGHT_Y" 0
        ;;
      *"org.wezfurlong.wezterm.org.wezfurlong.wezterm"*)
        move_and_maximize "$wid" "$MONITOR_LEFT_X" "$MONITOR_LEFT_Y" 0
        ;;
      *"vesktop.vesktop"*)
        move_and_maximize "$wid" "$MONITOR_RIGHT_X" "$MONITOR_RIGHT_Y" 1
        ;;
      *"todoist-nativefier-a2ca46.todoist-nativefier-a2ca46"*)
        move_and_maximize "$wid" "$MONITOR_RIGHT_X" "$MONITOR_RIGHT_Y" 1
        ;;
      *"Navigator.firefox"*)
        move_and_maximize "$wid" "$MONITOR_LEFT_X" "$MONITOR_LEFT_Y" 1
        ;;
      *"jetbrains-rider.jetbrains-rider"*)
        move_and_maximize "$wid" "$MONITOR_LEFT_X" "$MONITOR_LEFT_Y" 2
        ;;
      *"bruno.bruno"*)
        move_and_maximize "$wid" "$MONITOR_LEFT_X" "$MONITOR_LEFT_Y" 3
        ;;
      *"DBeaver.DBeaver"*)
        move_and_maximize "$wid" "$MONITOR_LEFT_X" "$MONITOR_LEFT_Y" 3
        ;;
      *"mastodon-nativefier-389aa3.mastodon-nativefier-389aa3"*)
        move_and_maximize "$wid" "$MONITOR_LEFT_X" "$MONITOR_LEFT_Y" 4
        ;;
      *"Mail.thunderbird-esr"*)
        move_and_maximize "$wid" "$MONITOR_LEFT_X" "$MONITOR_LEFT_Y" 4
        ;;
      *"obsidian.obsidian"*)
        move_and_maximize "$wid" "$MONITOR_LEFT_X" "$MONITOR_LEFT_Y" 4
        ;;
    esac
  done

  old_list=$new_list
done

