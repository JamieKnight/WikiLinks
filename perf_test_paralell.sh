#!/bin/bash
_now=$(date +"%s")
_url=".bbc.co.uk"

echo "Processing input files......"

function process {
     
     ls perftest/*.lump | parallel " grep -o '[^(|=[&;*/ ]*bbc\.co\.uk[^| ]*' {} > out/$_now/{/.}"
}

# Creat output director:
mkdir out/$_now
(time process)
