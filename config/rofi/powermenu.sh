#!/usr/bin/env bash

## Options
shutdown="󰐥 Shutdown"
reboot="󰜉 Reboot"
lock="󰌾 Lock"
suspend="󰒲 Sleep"
logout="󰍃 Logout"

## Rofi command with custom keybinds
rofi_cmd() {
    rofi -dmenu \
        -p "Power Menu" \
        -mesg "l=Lock | L=Logout | s=Lock+Sleep | S=Shutdown | R=Reboot" \
        -kb-custom-1 "l" \
        -kb-custom-2 "L" \
        -kb-custom-3 "s" \
        -kb-custom-4 "S" \
        -kb-custom-5 "R" \
        -theme ~/.config/rofi/powermenu.rasi
}

## Run
chosen="$(echo -e "$lock\n$logout\n$suspend\n$reboot\n$shutdown" | rofi_cmd)"
exit_code=$?

# Handle custom keybinds (exit codes 10-14)
case $exit_code in
    10) hyprlock ;;                      # l - Lock
    11) hyprctl dispatch exit ;;         # Shift+l - Logout
    12) hyprlock && systemctl suspend ;; # s - Lock+Sleep
    13) systemctl poweroff ;;            # Shift+s - Shutdown
    14) systemctl reboot ;;              # Shift+r - Reboot
    0)  # Normal selection
        case $chosen in
            $shutdown) systemctl poweroff ;;
            $reboot) systemctl reboot ;;
            $lock) hyprlock ;;
            $suspend) systemctl suspend ;;
            $logout) hyprctl dispatch exit ;;
        esac
        ;;
esac
