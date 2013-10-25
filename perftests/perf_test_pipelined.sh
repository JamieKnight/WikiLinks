#!/bin/bash
_now=$(date +"%s")
_url=".bbc.co.uk"

echo "Processing input files......"

function process {
     grep "$_url" source/a.chunk | grep -o '[^(|=[&;*/ ]*bbc\.co\.uk[^| ]*'  > out/$_now/single_perf_links.links.txt 
}

# Creat output director:
mkdir out/$_now
(time process)
