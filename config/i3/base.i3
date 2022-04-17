#- nvim: filetype=i3

exec source ~/.usrvars

## #---Window borders---# #
default_border pixel 2
default_border_radius 5
gaps inner 10
gaps outer 0

set $base00 #020202
set $base01 #ffffff
set $base02 #252936
set $base03 #7780a1
set $base04 #888888
set $base05 #d1d4e0

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
        background $base00
        statusline $base05
        separator  $base03
                #             ol     bg     fg
        focused_workspace  $base00 $base00  $base01
        active_workspace   $base00 $base00  $base03
        inactive_workspace $base00 $base00  $base04
    }
}

# Widow Colours
#                       border  background text    indicator
# client.focused          $base03 $base03    $base07 $base0F
# client.focused_inactive $base02 $base02    $base03 $base0F
# client.unfocused        $base02 $base02    $base03 $base0F
# client.urgent           $base02 $base08    $base00 $base0F
