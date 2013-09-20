#!/usr/bin/env bash
clear

# Are we running with arguments?
if [ -z "$2" ]
	then
		RUNNING_ARGUMENTS=false
	else
		RUNNING_ARGUMENTS=true
fi

trap "clear" 0 1 2 5 15

# Display the welcome message (Information)
dialog --title "Welcome to Drifter" \
--msgbox "\ndrifter is a set of scripts and
other tools that will assist you in creating a virtual infrastructure of
development environments." 0 0
clear

# Display the main menu (Menu)
dialog --title "Main Menu" \
--menu "Please choose an option:" 0 0 0 \
1 "Choose your OS" \
2 "Set how many servers" \
2 "Configure server packs" \
3 "Setup Network" \
4 "Exit drifter" &2> $main_menu

mainmenu=$(<"$main_menu")

case "$mainmenu" in
	1) chooseOS;;
	2) chooseVMCount;;
	3) setupNetwork;;
	4) clear;; break;;
esac

done


