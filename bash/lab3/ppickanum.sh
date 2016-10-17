#!/bin/bash

#lab3script1

num1=$(($RANDOM%10 +1))
read -p "Enter a number:" num2

while [ $num1 -ne $num2 ]
do
if [ $num1 -lt $num2 ]; then
echo "guess lower"
