#!/bin/bash
#
#display how many regular files there are in the Pictures directory
# and how much disk space they use. It should also show the sizes
# and names of the 3 largest files in that directory

##declarations
directory=~/Pictures
numFiles2Show=3
gotadirectory=no

#functions
function usage {
	echo "usage: $0 [-h|--help] [-c|--count number of files to display] [directory to work on]"
	echo "Count defaults to 3, directory default to ~/Pictures"
}
function error_message {
	echo "$@" >&2
}



##command line processing
while [ $# -gt 0 ]; do
	case "$1" in
		-h | --help ) #usage diagram
			usage
			exit 0
		;;
		-c | --count ) #specify how many files to count at end
			if [[ $2 =~ ^[1-9][0-9]*$ ]]; then
				numFiles2Show=$2
				shift
			else
				usage
				error_message "count requires a number"
				exit 1
			fi
		;;
		* ) #directory name to work on
			if [ $gotadirectory = "no" ]; then
				directory=$1
				gotadirectory="yes"
			else
				usage
				error_message "I didn't understand '$1' as a directory"
				exit 1
			fi			
		;;
		
	esac
	shift
done

##MAIN
echo -n "In the ~/Pictures directory, the number of files is:"
find $directory -type f | wc -l

echo -n "Those files use: "
du -sh $directory | awk '{print $1}'

echo "The $numFiles2Show largest files are:"
echo " ========================"
du -h $directory/* | sort -h | tail -$numFiles2Show
