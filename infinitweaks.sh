#!/bin/bash

readonly version="0.0.1"
readonly it_compatibility="1.10.x"

function aboutInfo {
	echo -e "\ninfinitweaks v$version\n"
	echo 	"Customize your own build of InfiniTime with only the apps you need."
	echo 	"Compatible with InfiniTime v$it_compatibility for the PineTime smartwatch by Pine64."
	echo 	"Enter 'help' for more options."
	echo 	"Enter 'about' to show this screen again."
	echo -e "https://github.com/toastom/infinitweaks \n"
}

function helpInfo {
	echo -e "\nHelp for infinitweaks v$version\nhttps://github.com/toastom/infinitweaks \n"
	echo -e "about\t\t\t   | about the project and version info"
	echo -e "all\t\t\t   | show all default InfiniTime apps/screens available to modify"
	echo -e "apply\t\t\t   | applies marked included/excluded changes"
	echo -e "clear\t\t\t   | clear the screen"
	echo -e "compile\t\t\t   | compile InfiniTime with marked changes"
	echo -e "include App1 App2 App3\t   | tells infinitweaks which app to include. Default is all. Must use the name shown from command 'all'"
	echo -e "exclude App4 App5 App6\t   | tells infinitweaks which app to exclude. Default is none. Must use the name shown from command 'all'"
	echo -e "setit <path-to-InfiniTime> | tells infinitweaks where the InfiniTime directory is"
	echo -e "show\t\t\t   | show marked InfiniTime changes. <i> is include, <e> is exclude"
	echo -e "remove <entry-to-remove>   | remove a selected app from the list of changes. Must use the name shown from command 'all'"
	echo -e "help\t\t\t   | show this screen again"
	echo ""
}

command_list=(
	"about"
	"all"
	"apply"
	"clear"
	"compile"
	"include"
	"exclude"
	"setit"
	"show"
	"remove"
	"help"
)

it_changes=("<e>InfiniPaint" "<i>Twos")


function all {
	echo ""
}

function apply {
	echo ""
}

function compile {
	echo ""
}

function include () {
	# Marking changes as <i> in $it_changes
	echo -e "\nAdding the following Apps and Watchfaces to marked changes:\n"
	
	local -i cnt
	cnt=0
	for i in $1
	do
		cnt=cnt+1
		user_change="<i>"
		user_change+=$( echo "$1" | cut -d " " --fields=$cnt )
		it_changes+=($user_change)
		echo -e "\t$user_change"
	done
	
	echo "Done."
	echo -e "Enter 'show' command to see all marked changes.\n"
}

function exclude () {
	# Same as include, just marked as excluded (<e> rather than <i>)
	echo -e "\nAdding the following Apps and Watchfaces to marked changes:\n"
	
	local -i cnt
	cnt=0
	for i in $1
	do
		cnt=cnt+1
		user_change="<e>"
		user_change+=$( echo "$1" | cut -d " " --fields=$cnt )
		it_changes+=($user_change)
		echo -e "\t$user_change"
	done
	
	echo "Done."
	echo -e "Enter 'show' command to see all marked changes.\n"
}

function setit () {
	echo ""
}

function show {
	echo ""
	for i in ${it_changes[*]}
	do
		echo "$i"
	done
	echo ""
}

function remove () {
	echo ""
}

# Start with welcome screen that shows info about the project
aboutInfo

# Command handling and main loop

while : ; do
	echo -n "> "
	read user_input
	
	# Get options that user entered with a command
	
	user_options=()
	for i in $user_input
	do
		if [[ "${command_list[*]}" =~ "$i" ]]
		then
			continue
		fi
		user_options+="$i "
		#echo $i
	done
	#echo ${user_options[*]}
	
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
		include*)
			include "${user_options[*]}"
			;;
		exclude*)
			exclude "${user_options[*]}"
			;;
		setit*)
			;;
		show)
			show
			;;
		remove*)
			;;
		help) 
			# Call help display function
			helpInfo
			;; # break
		clear)
			clear
			;;
		*)
			# Idfk what you just asked for
			echo -e "\nUnknown input. Enter 'help' for valid commands.\n"
			;;
	esac
done
