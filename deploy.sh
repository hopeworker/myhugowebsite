#!/bin/bash

git add .
# Commit changes.
msg="add new content to site `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg"
git push
