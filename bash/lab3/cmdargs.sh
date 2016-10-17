#!/bin/bash

#Display each command line parameter on a line by itself
#this is the core of command line processing


while [ $# -gt 0 ]; do
	echo "$1"

	#each time through the loop, shift the args left
	#this decrements the argument count for us
	shift
done
