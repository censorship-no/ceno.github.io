#!/bin/sh
# Usage: ./git-update-download.sh VERSION DATE {CHANNEL}
# Update download.html page with the given version + date of Ceno apk.

version=$1
date=$2
channel="${3:-release}"

sed -Ei \
    -e "s#<p><strong>CENO Browser .*</strong></p>#<p><strong>CENO Browser $version</strong></p>#g" \
    -e "s#'https://dcomm.net.ua/package/ceno/ceno-armeabi-v7a-.*.apk'#'https://dcomm.net.ua/package/ceno/ceno-armeabi-v7a-$channel-$version-$date.apk'#g" \
    -e "s#'https://dcomm.net.ua/package/ceno/ceno-arm64-v8a-.*.apk'#'https://dcomm.net.ua/package/ceno/ceno-arm64-v8a-$channel-$version-$date.apk'#g" \
    ./en.src/download.html

git add en.src/download.html
git commit -m "update ceno download link"
