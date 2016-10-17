#!/bin/bash

while [ 1 ]; do
	read -p "how many dice shall I roll[1-5]?" count
	[ -n "$count" ] || continue
	[[ $count =~ ^[1-5]$ ]] && break
done

for (( rolls=0 ; rolls < count ; rolls++ )); do
die1=$(($RANDOM %6 +1))
die2=$(($RANDOM %6 +1))
rolled=$(($die1 + $die2))

echo "rolled $die1 and $die2 for $rolled"
done
