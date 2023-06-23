#- nvim: filetype=i3

set $movestep "50px or 3ppt"

# This is useless since commands are not evaluated recursivly
set $scripts $HOME/.config/i3/scripts

set $resize exec $HOME/.i3/scripts/i3resize

mode "resize" {
	bindsym h	    $resize left   $movestep
	bindsym j	    $resize down   $movestep
	bindsym k	    $resize up     $movestep
	bindsym l	    $resize right  $movestep

	bindsym Left	$resize left$movestep
	bindsym Down	$resize down   $movestep
	bindsym Up 		$resize up     $movestep
	bindsym Right	$resize right  $movestep

    bindsym Return mode "default"
    bindsym Escape mode "default"
}

bindsym $mod+Ctrl+r mode "resize"

# #--- Navigate ---# #
## Vim Keys
bindsym $mod+h              focus left
bindsym $mod+j              focus down
bindsym $mod+k              focus up
bindsym $mod+l              focus right

bindsym $mod+p              focus parent
bindsym $mod+Shift+p        focus child 

bindsym $mod+Shift+h        move left  50px
bindsym $mod+Shift+j        move down  50px
bindsym $mod+Shift+k        move up    50px
bindsym $mod+Shift+l        move right 50px

bindsym $mod+Ctrl+h         $resize left   $movestep
bindsym $mod+Ctrl+j         $resize down   $movestep
bindsym $mod+Ctrl+k         $resize up     $movestep
bindsym $mod+Ctrl+l         $resize right  $movestep



## Arrow Keys
bindsym $mod+Left           focus left
bindsym $mod+Down           focus down
bindsym $mod+Up             focus up
bindsym $mod+Right          focus right

bindsym $mod+comma          focus parent
bindsym $mod+period         focus child

bindsym $mod+Shift+Left     move left
bindsym $mod+Shift+Down     move down
bindsym $mod+Shift+Up       move up
bindsym $mod+Shift+Right    move right

bindsym $mod+Ctrl+Left      $resize left   $movestep
bindsym $mod+Ctrl+Down      $resize down   $movestep
bindsym $mod+Ctrl+Up        $resize up     $movestep
bindsym $mod+Ctrl+Right     $resize right  $movestep

# #---Workspace Bindings---# #
bindsym $mod+Home           workspace first
bindsym $mod+Ctrl+Home      move workspace first
bindsym $mod+Shift+Home     move workspace first; workspace last
bindsym $mod+End            workspace last
bindsym $mod+Ctrl+End       move workspace last
bindsym $mod+Shift+End      move workspace last; workspace last
bindsym $mod+aring          workspace last
bindsym $mod+Ctrl+aring     move workspace last
bindsym $mod+Shift+aring    move workspace last; workspace last

bindsym $mod+Prior          workspace prev_on_output
bindsym $mod+Shift+Prior    move workspace prev_on_output; workspace prev_on_output;
bindsym $mod+Ctrl+Prior     move workspace prev_on_output
bindsym $mod+Next           workspace next_on_output
bindsym $mod+Shift+Next     move workspace next_on_output; workspace next_on_output;
bindsym $mod+Ctrl+Next      move workspace next_on_output


bindsym $mod+Mod3+Prior     move workspace to output eDP;
bindsym $mod+Mod3+Next      move workspace to output HDMI-A-0;

