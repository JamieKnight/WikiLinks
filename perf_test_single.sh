#!/bin/bash
_now=$(date +"%s")

echo "Processing input files......"

function process {
     grep -o '[^(|=[&;*/ ]*bbc\.co\.uk[^| ]*' source/a.chunk > out/$_now/single_perf_links.links.txt 
}

# Creat output director:
mkdir out/$_now
(time process)
