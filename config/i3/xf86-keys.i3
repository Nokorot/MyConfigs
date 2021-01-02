#- nvim: filetype=i3

## #---Extra XF86 Keys---# #
bindsym XF86AudioMute					$exec lmc mute
bindsym XF86AudioLowerVolume			$exec lmc down 1
bindsym Shift+XF86AudioLowerVolume		$exec lmc down 10
bindsym XF86AudioRaiseVolume			$exec lmc up 1
bindsym Shift+XF86AudioRaiseVolume		$exec lmc up 10
bindsym XF86PowerOff					$exec prompt "Shutdown computer?" "$shutdown"
bindsym XF86Calculator					$exec ddspawn dropdowncalc -f mono:pixelsize=24
##bindsym XF86Sleep		This binding is typically mapped by systemd automatically.
bindsym XF86Explorer					$exec $term -e $FILE
bindsym XF86WWW							$exec $BROWSER
bindsym XF86ScreenSaver					$exec lockscreen
bindsym XF86MyComputer					$exec $term -e $FILE
bindsym XF86Eject						$exec dmenuumount
bindsym XF86AudioNext					$exec lmc next
bindsym XF86AudioPlay					$exec lmc toggle
bindsym XF86AudioPrev					$exec lmc prev
bindsym XF86AudioStop					$exec lmc toggle
bindsym XF86AudioRewind					$exec lmc back 10
bindsym XF86AudioForward				$exec lmc forward 10
bindsym XF86HomePage					$exec $BROWSER
bindsym XF86Reload						restart
bindsym XF86Suspend						$exec lockscreen
bindsym XF86Close						kill
bindsym XF86WebCam						$exec camtoggle
bindsym XF86Mail						$exec $term -e neomutt && pkill -RTMIN+12 i3blocks
bindsym XF86Messenger					$exec $term -e weechat
bindsym XF86Search						$exec $BROWSER https://duckduckgo.com
bindsym Shift+XF86MonBrightnessDown		$exec sudo brightness -x -10
bindsym XF86MonBrightnessDown			$exec sudo brightness -c -10%
bindsym Shift+XF86MonBrightnessUp		$exec sudo brightness -x 10
bindsym XF86MonBrightnessUp				$exec sudo brightness -c 10%
bindsym XF86AudioMedia					$exec $term -e ncmpcpp
bindsym XF86Display						$exec displayselect
bindsym XF86Documents					$exec $term -e $FILE ~/Documents
# bindsym XF86Battery					$exec Dissplay remainding time (use the log files to calculate this) Or toggle/disable battery low sound.
