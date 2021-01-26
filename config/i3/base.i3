#- nvim: filetype=i3

## #---Window borders---# #
default_border pixel 2
default_border_radius 15
gaps inner 10
gaps outer 0

## #---Other settings---# #
floating_modifier $mod
popup_during_fullscreen smart

font pango:DejaVu Sans Mono 8

## #---Status Bar---# #
bar {
    font pango: FontAwsome 11
    status_command i3blocks
    position top
    strip_workspace_numbers yes
    separator_symbol "|" # 𓀅
    colors {
        background #020202
        statusline #ffffff
        separator #666666
                #             ol     bg     fg
        focused_workspace  #020202 #020202 #ffffff
        inactive_workspace #020202 #020202 #888888
    }
}


set $base00 #101218
set $base01 #1f222d
set $base02 #252936
set $base03 #7780a1
set $base04 #C0C5CE
set $base05 #d1d4e0
set $base06 #C9CCDB
set $base07 #ffffff
set $base08 #ee829f
set $base09 #f99170
set $base0A #ffefcc
set $base0B #a5ffe1
set $base0C #97e0ff
set $base0D #97bbf7
set $base0E #c0b7f9
set $base0F #fcc09e

# Widow Colours
#                       border  background text    indicator
client.focused            $base03 $base03    $base07 $base0F
# client.focused_inactive $base02 $base02    $base03 $base0F
# client.unfocused        $base02 $base02    $base03 $base0F
# client.urgent           $base02 $base08    $base00 $base0F

# Bar
# bar {
#   font pango: System San Francisco Display, FontAwesome 11
#   status_command i3blocks
#   position top 
#   strip_workspace_numbers yes
#   height 25
#   bindsym button4 nop
#   bindsym button5 nop
#   colors {
#     separator $base03
#     background $base01
#     statusline $base05
# #                      border  background text
#     focused_workspace  $base01 $base01    $base07
#     active_workspace   $base01 $base02    $base03
#     inactive_workspace $base01 $base01    $base03
#     urgent_workspace   $base01 $base01    $base08
#   }
# }

