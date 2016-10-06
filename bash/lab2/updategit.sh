#!/bin/bash

#this script saves me from remembering the git commands

git add -A
#anything after the name of the script will be the comment
git commit -m "$1"
git push
