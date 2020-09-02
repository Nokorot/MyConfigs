#- nvim: filetype=i3

set $movestep "50px or 3ppt"

mode "resize" {
	bindsym h	    $exec i3resize left   $movestep
	bindsym j	    $exec i3resize down   $movestep
	bindsym k	    $exec i3resize up     $movestep
	bindsym l	    $exec i3resize right  $movestep

	bindsym Left	$exec i3resize left   $movestep
	bindsym Down	$exec i3resize down   $movestep
	bindsym Up 		$exec i3resize up     $movestep
	bindsym Rgiht	$exec i3resize right  $movestep

    bindsym Return mode "default"
    bindsym Escape mode "default"
}

bindsym $mod+Ctrl+r mode "resize"

# Navigate
bindsym $mod+h				focus left
bindsym $mod+j				focus down
bindsym $mod+k				focus up
bindsym $mod+l				focus right

bindsym $mod+Shift+h		move left  50px
bindsym $mod+Shift+j		move down  50px
bindsym $mod+Shift+k		move up    50px
bindsym $mod+Shift+l		move right 50px

bindsym $mod+Ctrl+h			$exec i3resize left   $movestep
bindsym $mod+Ctrl+j			$exec i3resize down   $movestep
bindsym $mod+Ctrl+k			$exec i3resize up     $movestep
bindsym $mod+Ctrl+l			$exec i3resize right  $movestep

# #---Arrow Keys---# #
bindsym $mod+Left			focus left
bindsym $mod+Down			focus down
bindsym $mod+Up				focus up
bindsym $mod+Right 			focus right

bindsym $mod+Shift+Left		move left
bindsym $mod+Shift+Down		move down
bindsym $mod+Shift+Up		move up
bindsym $mod+Shift+Right 	move right

bindsym $mod+Ctrl+Left		$exec i3resize left   $movestep
bindsym $mod+Ctrl+Down		$exec i3resize down   $movestep
bindsym $mod+Ctrl+Up		$exec i3resize up     $movestep
bindsym $mod+Ctrl+Right		$exec i3resize right  $movestep

# #---Workspace Bindings---# #

bindsym $mod+Home			workspace first 
bindsym $mod+Ctrl+Home		move workspace first
bindsym $mod+Shift+Home		move workspace first; workspace last 
bindsym $mod+End			workspace last
bindsym $mod+Ctrl+End		move workspace last
bindsym $mod+Shift+End		move workspace last; 
bindsym $mod+aring			workspace last
bindsym $mod+Ctrl+aring	    move workspace last; workspace last
bindsym $mod+Shift+aring	move workspace last; workspace last

bindsym $mod+Prior			workspace prev
bindsym $mod+Shift+Prior	move workspace prev; workspace prev;
bindsym $mod+Ctrl+Prior	    move workspace prev
bindsym $mod+Next			workspace next
bindsym $mod+Shift+Next		move workspace next; workspace next;
bindsym $mod+Ctrl+Next		move workspace next
