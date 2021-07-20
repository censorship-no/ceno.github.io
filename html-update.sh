#!/bin/sh
# Usage: ./html-update.sh LANGUAGE
# Update HTML pages for the given language and place them under `LANGUAGE`.

RTL_LANGUAGES="ar fa"

set -e

test "$1" -a "$1" != en
cd "$1"

if echo "$RTL_LANGUAGES" | grep -qE "\b$1\b"; then
    dir=rtl

    # TODO: construct argument list for sed
    rtl_css="$(find ../css -name '*rtl*' -exec basename '{}' ';')"
else
    dir=ltr
fi

for po in *.po; do
    html="$(basename "${po%%.po}.html")"
    po2html --progress=none -i "$po" -t "../en/$html" -o "$html"

    if [ $dir = rtl ]; then
        sed -i 's/\(<html .* dir="\)ltr\(".*\)/\1rtl\2/' "$html"

        for css_rtl in $rtl_css; do
            css_ltr="$(echo "$css_rtl" | sed 's/.rtl//')"
            sed -i "s#/$css_ltr\"#/$css_rtl\"#g" "$html"
        done
    fi
done
