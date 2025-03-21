#!/bin/sh


# Get the current workspace number
cur=$(swaymsg -t get_workspaces -r \
            | jq '.. | select(.focused? and .type == "workspace").num')

target=$1

echo "Current workspace: $cur, target $target"

curr_workspaces=$(swaymsg -t get_workspaces -r)
echo "${curr_workspaces}" | jq ".. | select(.type? and .num == $target) | .visible, .output"
tgt_ws=$(echo "${curr_workspaces}" | jq ".. | select(.type? and .num == $target) | .visible, .output")
visible=`echo "${tgt_ws}" | head -1`
output=`echo "${tgt_ws}" | tail -1`
echo $vis
echo $visible
echo $output

if [[ -z "$tgt_ws" ]]; then
  # Create workspace
  swaymsg workspace number $target
  echo "swaymsg workspace number $target"
else
    echo "swaymsg [workspace = $target] move workspace to output current"
  # Move workspace to current output
  possible_error=$(swaymsg [workspace = $target] move workspace to output current)
  workaround=""

  # Check if moved workspace was visible
  if [ "$visible" = "true" ]; then
    # Make the move an output swap
    swaymsg [workspace = $cur] move workspace to output $output
    if [[ -n "$possible_error" ]]; then
        swaymsg workspace number $cur
        echo "swaymsg workspace number $cur"
        src_output=$(echo "${curr_workspaces}" | jq ".. | select(.type? and .num == $cur) | .output")
        echo "src: $src_output"
        swaymsg focus output $src_output
        echo workaround
    fi

  fi

  # Refocus after potential swaps
  swaymsg workspace number $target
fi
