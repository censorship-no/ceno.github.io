#!/bin/sh
# Usage: ./html-update.sh LANGUAGE
# Update HTML pages for the given language and place them under `LANGUAGE`.

RTL_LANGUAGES="ar fa"

set -e

test "$1" -a "$1" != en
cd "$1"

if echo "$RTL_LANGUAGES" | grep -qE "\b$1\b"; then
    dir=rtl
else
    dir=ltr
fi

for po in *.po; do
    html="$(basename "${po%%.po}.html")"
    po2html --progress=none -i "$po" -t "../en/$html" -o "$html"

    if [ $dir = rtl ]; then
        sed -Ei \
            -e 's#(<html\b.*\bdir=")ltr(")#\1rtl\2#' \
            -e 's#(<link\b.*\bhref="[^"]+/ceno-)ltr(\.css")#\1rtl\2#' \
            "$html"
    fi
done
