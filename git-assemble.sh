#!/bin/sh
# Usage: ./git-assemble.sh
# Makes git commits required to assemble the htlm files, extract the pot files, and update to po files.

git checkout i18n
git merge --no-ff origin/master
./html-assemble-en.sh
git add .
git commit -m "assemble en"
./pot-extract.sh
git add .
git commit -m "extract pot files"
./po-update.sh
git add .
git commit -m "update po files"
