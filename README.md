# WikiLinks

WikiLinks is a script for very quickly analysing links to a specific domain within large text datasets. The script was developed for analysing wikipedia, but its not wikipedia specific, hence the name.

It provides a tool too:

* Find all links to a specific domain on wikipeda.
* Create a frequency table for matched links

# In Details
Wikilinks is a Linux / Mac command line script which takes a directory of text files and provides a list of all the URLs present in the text file which point to a specific domain. 

For example, passing a domain of "bbc.co.uk" would return all links to pages on bbc.co.uk or subdomains thereof.

The script is _very_ fast, it can process the 45gb wikipedia data dump in less than 10 minutes on a 2012 15" Retina MacBook Pro (i5, 2.8ghz), and in 18 seconds on a 24 Core VPS.

## Analysing Wikipedia Dump Files.

Step 1: Checkout the repo to accsess the scripts.

Step 1: Download the wikipeda data dump from http://download.wikimedia.org/enwiki/latest/enwiki-latest-pages-articles.xml.bz2

Step 2: Once the data dump is downloaded, split it into as many chunks as you have CPU threads. Eg, for an 8 core box, splitting the dump of ~44gb into 8 would look something like:

    split -b 5750000000 enwiki-latest-pages-articles.xml 
    
 Step 3: 


# Performance

# System Requirements




