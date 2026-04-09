#!/bin/bash

MONITOR_DESC="desc:XMD Mi TV 0x00000001"
# Position it to the right of your UltraFine (3840 wide) + UltraWide (3440 wide) = adjust as needed
ENABLED_CONFIG="3840x2160@60, 7280x0, 1"

# Check current state
STATUS=$(hyprctl monitors all -j | jq -r '.[] | select(.description | contains("Mi TV")) | .disabled')

if [ "$STATUS" = "true" ] || [ -z "$STATUS" ]; then
  notify-send "TV" "Enabling Mi TV..." -t 2000
  hyprctl keyword monitor "$MONITOR_DESC, $ENABLED_CONFIG"
else
  notify-send "TV" "Disabling Mi TV..." -t 2000
  hyprctl keyword monitor "$MONITOR_DESC, disabled"
fi
