#!/bin/sh
# Usage: ./git-update-download.sh VERSION DATE {CHANNEL}
# Update download.html page with the given version + date of Ceno apk.

version=$1
date=$2
channel="${3:-release}"

sed -Ei \
    -e "s#<p><strong>Ceno Browser .*</strong></p>#<p><strong>Ceno Browser $version</strong></p>#g" \
    -e "s#'https://ceno-download.s3.amazonaws.com/ceno/v.*/ceno-armeabi-v7a-.*.apk'#'https://ceno-download.s3.amazonaws.com/ceno/v$version/ceno-armeabi-v7a-$channel-$version-$date.apk'#g" \
    -e "s#'https://ceno-download.s3.amazonaws.com/ceno/v.*/ceno-arm64-v8a-.*.apk'#'https://ceno-download.s3.amazonaws.com/ceno/v$version/ceno-arm64-v8a-$channel-$version-$date.apk'#g" \
    -e "s#"https://ceno-download.s3.amazonaws.com/ceno/v.*/sha256sums.txt.asc"#"https://ceno-download.s3.amazonaws.com/ceno/v$version/sha256sums.txt.asc"#g" \
    -e "s#"https://ceno-download.s3.amazonaws.com/ceno/v.*/sha256sums.txt"#"https://ceno-download.s3.amazonaws.com/ceno/v$version/sha256sums.txt"#g" \
    ./en.src/download.html

git add en.src/download.html
git commit -m "update ceno download link"
