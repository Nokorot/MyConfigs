#- nvim: filetype=i3

# #---Basic Definitions---# #
set $term kitty # $TERMINAL 	#% Set $TERMIAL in .profile
# set $mod Mod4
set $mod2 Shift 
set $mod3 Control

set $exec exec --no-startup-id
set $dd   exec --no-startup-id dml

bindsym $mod+Mod3+k		exec xdotool mousemove_relative -p   0 10
bindsym $mod+Mod3+l		exec xdotool mousemove_relative -p  90 10
bindsym $mod+Mod3+j		exec xdotool mousemove_relative -p 180 10
bindsym $mod+Mod3+h		exec xdotool mousemove_relative -p 270 10

bindsym $mod+Mod3+g		exec xdotool mousedown 1 mouseup 1
bindsym $mod+Mod3+n	    exec xdotool mousedown 2 mouseup 2
bindsym $mod+Mod3+v		exec xdotool mousedown 1
bindsym $mod+Mod3+b		exec xdotool mouseup 1

bindsym $mod+Mod3+u		exec xdotool click 4
bindsym $mod+Mod3+i		exec xdotool click 5


## #---Basic Bindings---# #
bindsym $mod+Return 		$dd terminal

bindsym $mod+Shift+Escape 	    $dd exit
bindsym $mod+Shift+BackSpace	$dd shutdown
 
bindsym Mod1+Ctrl+l		$dd lock 
bindsym $mod+x			$dd lock

## i3 commands
bindsym $mod+f			fullscreen toggle
bindsym $mod+q			kill

bindsym $mod+s			gaps inner current plus 5
bindsym $mod+Shift+S	gaps inner current minus 5
# bindsym $mod+Shift+d	gaps inner current set 0

bindsym $mod+o          border radius plus 5
bindsym $mod+Shift+o    border radius minus 5

bindsym $mod+b			  $dd bookmarks # bar mode toggle

bindsym $mod+n			  $dd nb # bar mode toggle
bindsym $mod+Shift+b	border toggle

bindsym $mod+Mod1+w 	layout tabbed
bindsym $mod+Mod1+e 	layout toggle split

bindsym $mod+t			split toggle

bindsym $mod+Shift+f    	focus mode_toggle
bindsym $mod+Shift+space 	floating toggle

## #---Letter Key Bindings---# #
# bindsym $mod+oslash 	$exec dmenu_unicode
bindsym $mod+backslash 	$dd unicode



bindsym $mod+a 		    $exec dml nn_notes # nn -browse -notes-dir "$HOME/Notes"
bindsym $mod+u 		    $exec dml nn_unim # nn -browse -notes-dir "$HOME/UniMaterial"

# bindsym $mod+c			  $exec $HOME/.i3/scripts/ddspawn icalc.py # dd-halc 
bindsym $mod+c			  $exec $HOME/.i3/scripts/ddspawn icalc.py # dd-halc 
bindsym $mod+Shift+n	$exec $HOME/.i3/scripts/ddspawn nb  # dd-halc 

bindsym $mod+w      $exec rofi -show window


bindsym $mod+d			$exec dml 
bindsym $mod+Shift+d	$exec dmenu_run

bindsym $mod+m 			$dd music

# bindsym $mod+w      sticky toggle
# bindsym $mod+w	        $dd browser 
# bindsym $mod+Shift+a	$dd pulsemixer

## #---Media Keys---# #
# Volume keys
bindsym $mod+Shift+m			$exec lmc mute
bindsym $mod+plus				$exec lmc up 5
bindsym $mod+Shift+plus			$exec lmc up 1
bindsym $mod+minus 				$exec lmc down 5
bindsym $mod+Shift+minus		$exec lmc down 1

# mpd keys
# bindsym $mod+comma 				$exec lmc prev
# bindsym $mod+period 			$exec lmc next

bindsym $mod+less 				$exec lmc prev
bindsym $mod+Shift+less			$exec lmc replay
bindsym $mod+greater			$exec lmc next
bindsym $mod+Shift+greater		$exec lmc next
# bindsym $mod+p					$exec lmc toggle
# bindsym $mod+Shift+p			$exec lmc pause
# For advancing forward/backward in an mpd song
bindsym $mod+bracketleft 		$exec lmc back 10
bindsym $mod+Shift+bracketleft 	$exec lmc back 120
bindsym $mod+bracketright 		$exec lmc forward 10
bindsym $mod+Shift+bracketright $exec lmc forward 120


## #---Function Buttons---# #
# bindsym $mod+F1		
bindsym $mod+F2		$exec ~/.i3/gen_conf; restart
# bindsym $mod+F3	
# bindsym $mod+F4		
# bindsym $mod+F5		
bindsym $mod+F6		$exec torwrap 		#% transmition tool
bindsym $mod+F7		$exec td-toggle		#% transmition tool
# bindsym $mod+F8		
bindsym $mod+F9		$exec dmenu_mount
bindsym $mod+F10	$exec dmenu_umount
bindsym $mod+F11	$exec ducksearch
bindsym $mod+F12	$dd nmtui

# For screenshots
# maim pic-full-"$(date '+%y%m%d-%H%M-%S').png"
bindsym Print 				$exec prtscreen root
#bindsym Shift+Print 		$exec prtscreen area
bindsym Control+Print 		$exec prtscreen curwin
bindsym $mod+Scroll_Lock	$exec "killall screenkey || screenkey"
