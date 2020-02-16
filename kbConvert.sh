#!/bin/sh
# Author: Emmitt B. Houston III
# While working at the University of Wisconsin Milwaukee
# Date Created: 12/7/19
# Date Last Modified: 12/9/19
# 
# Description in support of our documentation project, I did some testing with pandoc. Pandoc was recommended to me by Kyle Brockman of ADM 
# when we were working to convert a document he created to something usable in the kb.
# I wrote a little script around it for the purpose of converting Word documents (.docx) to HTML. Using xargs I made a one-liner to convert an entire directory of documents.



#filename=Sign-inIssues.docx

# File to be converted
filename="$1"

# Remove file extension and directory portion
fname=$(basename "$filename" .docx)

# Input file format
iFormat=docx

# Output file format
oFormat=html

# Output directory
oDir="/Users/bhouston/UWM/Campus Technology - Desktop Support/CTS Documentation/HTML-Conversions"

# Output file name
oFile=$oDir/$fname.$oFormat

# Document Title
title=$fname

# Folder to store extracted media
media="$oDir/$fname"



# (example: pandoc Convert_Intro_to_Cherwell.docx -s -f docx -t html -o Convert_Intro_to_Cherwell.html --extract-media=Convert_Intro_to_Cherwell --metadata title="Convert_Intro_to_Cherwell")
# To batch convert
#
# find "/Users/bhouston/UWM/Campus Technology - Desktop Support/CTS Documentation/DS Techician (Windows) documentation project" -name "*.docx"|xargs -I % ./kbConvert.sh %
#

#command
# any documents that don't have a corresponding media folder or images are of the incorrect height/width:
#   Open the original word document, "Reduce File Size" and save again. Convert the document again and compare the output to the orignal
# There are issues with some images and how they are inserted in some Word documents

# Conversion command
/usr/local/bin/pandoc "$filename" -s -f $iFormat -t $oFormat --dpi=150 --extract-media="$media" -o "$oFile" --metadata title="$title"

echo "...Converting $fname from .DOCX to .HTML"
echo "...Output will be saved to: $oDir"
echo "...Complete!"

exit 0
