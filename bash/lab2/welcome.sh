#!/bin/bash

#this program uses echo with the variables: MYNAME as an enviroment variable,
#mytitle as a local variable, and command substituon

export MYNAME="Alex Macdonald"
mytitle="Captian"

planet=`hostname`
weekday=$(date +%A)

echo "Welcome to planet $planet, $mytitle $MYNAME!"
echo "Today is $weekday."
