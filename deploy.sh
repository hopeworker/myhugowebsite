#!/bin/bash

git add .
# Commit changes.
msg="add new content to site `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg"
git push

## submodule change
## make submodule(themes/hugo-theme-cleanwhite) change
# cd themes/hugo-theme-cleanwhite
# git commit -am "make submodule change comment"
# cd ..
# git submodule update --remote --rebase
# git add .
# git commit -m "add main module change"
# git push --recurse-submodules=on-demand