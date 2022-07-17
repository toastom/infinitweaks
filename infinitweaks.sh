#!/bin/bash

version="0.0.1"
it_compatibility="1.10.x"

function aboutInfo {
	echo -e "\ninfinitweaks v$version\n"
	echo 	"Customize your own build of InfiniTime with only the apps you need."
	echo 	"Compatible with InfiniTime v$it_compatibility for the PimeTime smartwatch by Pine64."
	echo 	"Enter 'help' for more options."
	echo 	"Enter 'about' to show this screen again."
	echo -e "https://github.com/toastom/infinitweaks \n"
}

function helpInfo {
	echo -e "\nHelp for infinitweaks v$version\nhttps://github.com/toastom/infinitweaks \n"
	echo -e "about\t\t\t   | about the project and version info"
	echo -e "all\t\t\t   | show all default InfiniTime apps/screens available to modify"
	echo -e "apply\t\t\t   | applies marked included/excluded changes"
	echo -e "compile\t\t\t   | compile InfiniTime with marked changes"
	echo -e "include <app-to-include>   | tells infinitweaks which app to include. Default is all. Must use the name shown from command 'all'"
	echo -e "exclude <app-to-exclude>   | tells infinitweaks which app to exclude. Default is none. Must use the name shown from command 'all'"
	echo -e "setit <path-to-InfiniTime> | tells infinitweaks where the InfiniTime directory is"
	echo -e "show\t\t\t   | show marked InfiniTime changes. <i> is include, <e> is exclude, <~> is unmodified"
	echo -e "remove <entry-to-remove>   | remove a selected app from the list of changes. Must use the name shown from command 'all'"
	echo -e "help\t\t\t   | show this screen again\n"
}

it_changes={}

function all {
	echo ""
}

function apply {
	echo ""
}

function compile {
	echo ""
}

function include {
	echo ""
}

function exclude {
	echo ""
}

function setit {
	echo ""
}

function show {
	for e in it_changes
	do
		echo -e "\n"
		echo -e "$e\n"
	done
}

function remove {
	echo ""
}

# Start with welcome screen that shows info about the project
aboutInfo

# Command handling and main loop

while : ; do
	echo -n "> "
	read user_input
	
	case $user_input in 
		about)
			# About screen
			aboutInfo
			;;
		all)
			;;
		apply)
			;;
		compile)
			;;
		include)
			;;
		exclude)
			;;
		setit)
			;;
		show)
			;;
		remove)
			;;
		help) 
			# Call help display function
			helpInfo
			;; # break
		*)
			# Idfk what you just asked for
			echo -e "\nUnknown input. Enter 'help' for valid commands.\n"
			;;
	esac
done
