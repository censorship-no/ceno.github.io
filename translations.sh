#!/bin/sh
# Usage: ./translations.sh
# List the languages with usable translations.

for index in $(find . -name index.po); do
    if [ -f "${index%%.po}.html" ]; then
        echo "$(basename $(dirname "$index"))"
    fi
done
