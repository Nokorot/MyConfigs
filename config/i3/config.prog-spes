#- nvim: filetype=i3

## #---Program spesifics---# #
#
assign [class="vlc"] $WSmovie

for_window 	[class="chrome"] 	border pixel 3

assign [instance="netflix"] $WSmovie
for_window 	[instance="netflix"] 	border pixel 0
for_window 	[instance="netflix"] 	border radius 0

assign [class="thunderbird"] $WS10

assign [class="discord"] $WS6
for_window [class="discord"]    floating enable
for_window [class="discord"]    resize set 1200 800
for_window [class="discord"]    move position center


# for_window 	[class="okular"] 	    move workspace $WS7
# for_window 	[class="okular"] 		workspace $ws7; layout tabbed
for_window 	[class="Pinentry"] 		sticky enable
for_window 	[class="sent"] 			border pixel 0px
for_window 	[title="GIMP Startup"] 	move workspace $WSgimp
for_window 	[class="Gimp"] 			move workspace $WSgimp
for_window 	[window_role="GtkFileChooserDialog"] resize set 800 600
for_window 	[window_role="GtkFileChooserDialog"] move position center
for_window 	[title="Default - Wine desktop"] 	 floating enable


# Bindings to make the webcam float and stick.
for_window 	[title="mpvfloat"] floating enable
for_window 	[title="mpvfloat"] sticky enable
for_window 	[title="mpvfloat"] border pixel 0
no_focus 	[title="mpvfloat"]


## #---Dropdown Windows---# #
# General dropdown window traits. The order can matter.
for_window [instance="dropdown_*"] floating enable
for_window [instance="dropdown_*"] move scratchpad
for_window [instance="dropdown_*"] sticky enable
for_window [instance="dropdown_*"] scratchpad show
for_window [instance="dropdown_*"] resize set 1400 800
for_window [instance="dropdown_tmuxdd"] resize set 625 450
for_window [instance="dropdown_dropdowncalc"] resize set 800 600
for_window [instance="dropdown_tmuxdd"] border pixel 3
for_window [instance="dropdown_dropdowncalc"] border pixel 2
for_window [instance="dropdown_*"] move position center

