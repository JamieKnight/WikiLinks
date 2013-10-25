# WikiLinks
WikiLinks is a script for quickly analysing links to a specific domain within large text datasets. The script was developed for analysing wikipedia (hence the name), but it is not wikipedia specific.

It provides a tool too:

* Find all links to a specific domain on wikipeda.
* Create a frequency table for matched links

# In Detail
Wikilinks is a Linux / Mac command line script which takes a directory of text files and provides a list of all the URLs present in the text file which point to a specific domain. 

For example, passing a domain of "bbc.co.uk" would return all links to pages on bbc.co.uk or subdomains thereof.

The script is _very_ fast, it can process the 45gb wikipedia data dump in less than 10 minutes on a 2012 15" Retina MacBook Pro (i5, 2.8ghz), and in 18 seconds on a 24 Core VPS.

# Example Usage.
After placing your input files into /data , edit the $_url key in ''''wikilink.sh''''.

The run the script from the root of the checkout using: 

./wikilink.sh

By default, the script will process all the files in parallel and produce a date output directory in /results.

# Performance
Wikilinks is very fast, for an indepth explanation as to why, take a look at the blog post here.

To get the best performance for datasets larger than 1gb, it is best to split the files. This will allow the files to be processed in parallel.

Performance is heavily dependent on IO speed, so if analysing a large dataset such as wikipedia, use an SSD!

# System Requirements
The script is dependent on the GNU parallels library, which can be installed via homebrew on Mac, and apt-get on Ubuntu. 

The script as been tested on OSX 10.8.0 to OSX 10.9.0 and Ubuntu 13.

The script is known to work well on the DigitalOcean VPS infrastructure.