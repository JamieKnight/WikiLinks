#!/bin/bash

#config: 

_url=".bbc.co.uk" #Set this to the URL you wish to find, include a proceding . to capture sub domains
_escaped="bbc\.co\.uk"
#End Config

_now=$(date +"%m-%d-%y+%s")

echo "Processing input files......"

mkdir results/$_now

function process() { 
    #Do the grep, in parallel across all the files passed in.
	ls data/* | parallel --gnu "grep "$_url" {} | grep -o '[^(|=[&;*/ ]*$_escaped[^| ]*' > results/$_now/{/}.txt"
	
	# Merge the results from the parallel stage.
	cat results/$_now/*.txt > results/$_now/links.txt
    
    # Create a checksum of the results for easy result verification during performance tuning.
    #echo "MD5 checksum for results:"
    #echo $(md5sum results/$_now.results.txt)
    
    # Sort completed, first sort the results, then remove duplicates to get a frequency table.
    echo "Grep Complete... Sorting and ordering"
    cat results/$_now/links.txt | sort | uniq -c | sort > results/$_now/unique_links.txt
    
}
(time process)
