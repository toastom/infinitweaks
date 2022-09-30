#!/bin/bash

readonly version="0.1.1"

function aboutInfo {
	echo -e "\ninfinitweaks v$version\n"
	echo 	"Customize your own build of InfiniTime with only the apps you need."
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
	echo -e "include App1 App2 App3\t   | tells infinitweaks which app to include. Default is all. Must use the name shown from command 'all'"
	echo -e "exclude App4 App5 App6\t   | tells infinitweaks which app to exclude. Default is none. Must use the name shown from command 'all'"
	echo -e "setit <path-to-InfiniTime> | tells infinitweaks where the InfiniTime directory is"
	echo -e "show\t\t\t   | show marked InfiniTime changes. <i> is include, <e> is exclude"
	echo -e "remove <entry-to-remove>   | remove a selected app from the list of changes. Must use the name shown from command 'all'"
	echo -e "help\t\t\t   | show this screen again"
	echo ""
}

readonly -a command_list=(
	"about"
	"all"
	"apply"
	"clear"
	"include"
	"exclude"
	"setit"
	"show"
	"remove"
	"help"
)

it_changes=()
it_dir=""

# Check if the user has set a proper IT repo with setit command
# Later add InfiniTime as a git submodule in this repo
function check_it () {
	# Make sure the IT directory is valid and not empty
	if [ ! -d $1 ] || [ -z $1 ];
	then
		echo -e "\nERROR: Local InfiniTime repository not found."
		return 1
	fi
	return 0
}

# Show all apps and watchfaces available for the user to modify
# Dependent on the version of IT directory set by 'setit' command
function all {
	check_it $it_dir
	# If checking the IT dir resulted in an error, return that same error
	if [ ! $? = 0 ];
	then
		echo ""
		return $?
	fi
	
	python3 scripts/search_apps.py $it_dir
	
	#echo -e "\nNOTE: Removal of some features necessary to InfiniTime may cause instability."
	#echo "It is recommended to backup your InfiniTime repository before continuing."
	#echo "When using the 'include' and 'exclude' commands, enter only the app name without any extension."
	#echo "e.g. 'exclude InfiniPaint' NOT 'exclude InfiniPaint.cpp'"
}

# Requires $it_dir to be set by 'setit' command
# Edits the files in the $it_dir directory to apply marked changes
function apply {
	check_it $it_dir
	python3 scripts/apply_it_changes.py
}

# Include a new app or watchface into the list of marked changes to InfiniTime
# Maybe later also check to see if the app they want to include or exclude is present in 
# the marked IT directory
function include () {
	check_it $it_dir
	# Marking changes as <i> in $it_changes
	echo -e "\nAdding the following apps and watchfaces to marked changes:\n"
	
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
	
	echo -e "Enter 'show' command to see all marked changes.\n"
}

# Exclude an app or watchface from InfiniTime, added to the list of marked changes to InfiniTime
function exclude () {
	check_it $it_dir
	# Same as include, just marked as excluded (<e> rather than <i>)
	echo -e "\nAdding the following apps and watchfaces to marked changes:\n"
	
	local -i count
	count=0
	for i in $1
	do
		count=count+1
		user_change="<e>"
		user_change+=$( echo "$1" | cut -d " " --fields=$count )
		it_changes+=($user_change)
		echo -e "\t$user_change"
	done
	
	echo -e "Enter 'show' command to see all marked changes.\n"
}

# Set the InfiniTime directory to read and write to
function setit () {
	check_it $1
	# Not a good directory from check_it
	if [ $? -ne 0 ];
	then
		echo -e "\nInfiniTime directory not set."
		echo -e "InfiniTime directory previously set as $it_dir\n"
		return 1
	fi
	it_dir=$1
	echo -e "\nInfiniTime directory set as $it_dir\n"
}

# Show all marked changes
function show {
	echo ""
	for i in ${it_changes[*]}
	do
		echo "$i"
	done
	echo ""
}

# Remove marked change
# Search in the it_changes array for the specified app/watchface input
# If it doesn't match or otherwise isn't found, tell the user and give an error
# If it does match, remove the entry
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
	
	case $user_input in 
		about)
			aboutInfo
			;;
		all)
			all
			;;
		apply)
			apply
			;;
		include*)
			include "${user_options[*]}"
			include "${user_options[*]}"
			;;
		exclude*)
			exclude "${user_options[*]}"
			;;
		setit*)
			setit "${user_options[*]}"
			;;
		show)
			show
			;;
		remove*)
			remove "${user_options[*]}"
			;;
		help) 
			helpInfo
			;;
		clear)
			clear
			;;
		*)
			# Idfk what you just asked for
			echo -e "\nUnknown input. Enter 'help' for valid commands.\n"
			;;
	esac
done
