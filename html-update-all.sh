#!/bin/sh
# Usage: ./html-update-all.sh
# Update HTML pages for all usable translations.

set -e
for t in $(./translations.sh); do
    ./html-update.sh "$t"
done
