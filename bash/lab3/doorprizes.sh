#!/bin/bash

possibleprizes=("new car" "shhopping spree" "trip to haiwaii" "weekend in vegas" "tutoring" "high five" "waaaad")
prizecount=$(#possibleprizes[@])

prizenum=$(($RANDOM % $prizecount))

declare -a mysteryprize
mysteryprize[0]=${possibleprizes[$prizenum]}

prizenum=$
