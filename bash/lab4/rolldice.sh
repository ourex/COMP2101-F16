#!/bin/bash
#asks the user for a count of dice and then rolls them, default is 

##declare vars
declare -i count #number of dice to roll
declare -i sides #number of sides on dice must be between 4-20
sides=0

#functions
function usage {
	echo "usage: $1 [-h] [-c numberofdice] [-s 4-20]"
}
function errormessage {
	echo "$@" >&2
}


#Command line processing

while [ $# -gt 0 ]; do
	case "$1" in
	-h )
		usage
		exit 0
	;;

	-c )
		if [[ "$2" =~ ^[1-9][0-9]*$ ]]; then
			count=$2
			shift
		else
			errormessage "You gave '$2' as the number of dice rolls, fix that"
			exit 1
		fi
	;;

	-s )
		if [[ "$2" =~ ^[1-9][0-9]*$ ]]; then
			if [ $2 -lt 4 -o $2 -gt 20 ]; then
				errormessage "number of sides must be between 4-20"
				exit 1
			else
				sides=$2
				shift
			fi
		else
			errormessage "You gave '$2' as the number of sided dice, fix that"
			exit 1
		fi
	;;
	* )
		echo "I don't understand '$1'" >&2
		usage
		exit 1	
	;;
	esac
	shift
done


#user input validation
until [ $count -gt 0 ]; do
	read -p "How many dice shall I roll? " count
done
until [ $sides -gt 3 -a $sides -lt 21 ]; do
	read -p "How many sides should the die have[4-20]? " sides
done

#main/work
for (( rolls=0 ; rolls < count ; rolls++ )); do
	die1=$(($RANDOM % $sides +1))
	echo "Rolled $die1"
done
