#!/bin/sh
# Usage: ./po-update.sh
# Update PO files with latest PO templates from `en`.

set -e

# HTML translations.
for po in $(find . -maxdepth 2 -name '*.po'); do
    pot="en/$(echo "$po" | sed -E 's#^\./[^/]+/##')t"
    msgmerge -q --previous -U "$po" "$pot"
done

# Image translations.
for pot in $(find img -name '*.pot'); do
    for po in "$(dirname "$pot")"/*.po; do
        msgmerge -q --previous -U "$po" "$pot"
    done
done
