#!/bin/bash
_now=$(date +"%m-%d-%y+%s")
_url=".bbc.co.uk"

echo "Processing input files......"
mkdir out/$_now
function process() { 
	ls data/* | parallel --gnu "grep "bbc.co.uk" {} | grep -o '[^(|=[&;*/ ]*bbc\.co\.uk[^| ]*' > out/$_now/{/}.txt"
}
(time process)
