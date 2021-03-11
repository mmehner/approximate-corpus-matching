#!/bin/bash

# dependencies: agrep, sed

# first argument is text to be matched against corpus
# second argument is location of corpus

strlength=30
errno=9
beforestr=""
afterstr=""
output="${1%.*}_a-matched.txt"

echo "" > "${output}"

while IFS= read -r ln;
do
    echo "${ln}" >> "${output}"
    echo "Splitting and matching ${ln}"
    seg=$(echo "${ln}" | sed -e 's_^'"${beforestr}"'\(.\+\)'"${afterstr}"'$_\1_')
    remain="${seg}"
    seglength=${#seg}
    while [ "$seglength" -gt "$strlength" ]
    do
	searchstr="${seg:0:$strlength}"
	agrep -H -$errno "${searchstr}" $2 >> "${output}"
	seg=${seg:$strlength}
	seglength=${#seg}
    done
    
    if [ "$seglength" -gt 0 ]
    then
	agrep -H -$errno "$(echo "$remain" | rev | cut -c-${strlength} | rev)" $2 >> "${output}"
    fi
    echo "" >> "${output}"
    
done < <(sed '/^\s*$/d' "${1}")

echo "done!"
