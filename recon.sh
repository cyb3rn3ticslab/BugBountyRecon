#!/bin/bash
DOMAIN=$1
DIRECTORY=${DOMAIN}_recon
TODAY=$(date)

echo "This scan was created on $TODAY"

echo "Creating directory $DIRECTORY. "
mkdir $DIRECTORY

if [ $2 == "nmap-only" ]; then
    echo "Start scanning using nmap"
    # nmap $DOMAIN > $DIRECTORY\nmap_result
    echo "The results of nmap scan are stored in $DIRECTORY/nmap_recon"
elif [ $2 == "dirsearch-only" ]; then
    echo "Start scanning using dirsearch"
    cd ../dirsearch && python3 dirsearch.py -u $DOMAIN -e php > $DIRECTORY\dirsearch
    echo "The results of dirsearch scan are stored in $DIRECTORY/dirsearch."   
else
    echo "Start scanning using nmap"
    # nmap $DOMAIN > $DIRECTORY\nmap_result
    echo "The results of nmap scan are stored in $DIRECTORY/nmap_recon"

    echo "Start scanning using dirsearch"
    cd ../dirsearch && python3 dirsearch.py -u $DOMAIN -e php > $DIRECTORY\dirsearch
    echo "The results of dirsearch scan are stored in $DIRECTORY/dirsearch." 

fi

    


