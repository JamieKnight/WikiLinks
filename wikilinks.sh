#!/bin/bash
_now=$(date +"%m-%d-%y+%s")
_url=".bbc.co.uk"

echo "Processing input files......"

mkdir results/$_now

function process() { 
	ls data/* | parallel --gnu "grep "bbc.co.uk" {} | grep -o '[^(|=[&;*/ ]*bbc\.co\.uk[^| ]*' > results/$_now/{/}.txt"
	cat results/$_now/*.txt > results/$_now.results.txt
	echo "MD5 checksum for results:"
	echo $(md5sum results/$_now.results.txt)
}
(time process)
