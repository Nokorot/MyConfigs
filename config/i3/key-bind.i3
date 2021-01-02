#- nvim: filetype=i3

# #---Basic Definitions---# #
set $term $TERMINAL 	#% Set $TERMIAL in .profile
set $mod Mod4
set $mod2 Shift 
set $mod3 Control

set $exec exec --no-startup-id
set $dd   exec --no-startup-id dml


## #---Basic Bindings---# #
bindsym $mod+Return 		$exec $term

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

bindsym $mod+b			bar mode toggle
bindsym $mod+Shift+b	border toggle

bindsym $mod+Mod1+w 	layout tabbed
bindsym $mod+Mod1+e 	layout toggle split

bindsym $mod+t			split toggle

bindsym $mod+Shift+f    	focus mode_toggle
bindsym $mod+Shift+space 	floating toggle

## #---Letter Key Bindings---# #
bindsym $Mod+oslash 	$exec dmenuunicode

bindsym $mod+n 		    $exec nn --browse

bindsym $mod+c			$exec ddspawn dd-calc 

bindsym $mod+d			$exec dml 
bindsym $mod+Shift+d	$exec dmenu_run

bindsym $mod+m 			$dd music
bindsym $mod+w	        $dd browser 
#bindsym $mod+Shift+a	$dd pulsemixer

## #---Media Keys---# #
# Volume keys
bindsym $mod+Shift+m			$exec lmc mute
bindsym $mod+plus				$exec lmc up 5
bindsym $mod+Shift+plus			$exec lmc up 1
bindsym $mod+minus 				$exec lmc down 5
bindsym $mod+Shift+minus		$exec lmc down 1

# mpd keys
bindsym $mod+comma 				$exec lmc prev
bindsym $mod+period 				$exec lmc next

bindsym $mod+less 				$exec lmc prev
bindsym $mod+Shift+less			$exec lmc replay
bindsym $mod+greater			$exec lmc next
bindsym $mod+Shift+greater		$exec lmc next
bindsym $mod+p					$exec lmc toggle
bindsym $mod+Shift+p			$exec lmc pause
# For advancing forward/backward in an mpd song
bindsym $mod+bracketleft 		$exec lmc back 10
bindsym $mod+Shift+bracketleft 	$exec lmc back 120
bindsym $mod+bracketright 		$exec lmc forward 10
bindsym $mod+Shift+bracketright $exec lmc forward 120


## #---Function Buttons---# #
# bindsym $mod+F1		
bindsym $mod+F2		$exec ~/.config/i3/gen_conf; restart
# bindsym $mod+F3	
# bindsym $mod+F4		
# bindsym $mod+F5		
bindsym $mod+F6		$exec torwrap 		#% transmition tool
bindsym $mod+F7		$exec td-toggle		#% transmition tool
# bindsym $mod+F8		
bindsym $mod+F9		$exec dmenumount
bindsym $mod+F10	$exec dmenuumount
bindsym $mod+F11	$exec ducksearch
bindsym $mod+F12	$dd nmtui

# For screenshots
# maim pic-full-"$(date '+%y%m%d-%H%M-%S').png"
bindsym Print 				$exec gnome-screenshot
bindsym Shift+Print 		$exec gnome-screenshot -a
bindsym Control+Print 		$exec gnome-screenshot -w
bindsym $mod+Scroll_Lock	$exec "killall screenkey || screenkey"
