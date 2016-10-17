#!/bin/bash

#Create an array of colours, with at least 4 colours in it.
#Create an associative array of animals,
#where the keys are colours,
#and the values are animals who are that colour. Use the colours you put
#into the first array. Ask the user for a number and use it to
#display a colour from the array, then the corresponding animal from the
#associative array for that colour

declare -A animals

colours=(
	"red"
	"green"
	"blue"
	"yellow"
	"orange"
	"black and white"
)

animals=(
	["red"]="cardinal"
	["green"]="frog"
	["blue"]=lobster
	["yellow"]="canary"
	["orange"]="trumpapottamus"
	["black and white"]=zebra
)

for colour in "${colours[@]}" ; do
	echo "the $colour animal is a ${animals[$colour]}"
done


