#!/bin/bash
DOMAIN=$1
DIRECTORY=${DOMAIN}_recon
TODAY=$(date)

echo "This scan was created on $TODAY"

echo "Creating directory $DIRECTORY. "
mkdir $DIRECTORY

case $2 in 
    nmap-only)
        echo "Start scanning using nmap"
        # nmap $DOMAIN > $DIRECTORY/nmap_result
        echo "The results of nmap scan are stored in $DIRECTORY/nmap"
    ;;    
    dirsearch-only)
        echo "Start scanning using dirsearch"
        dirsearch -u $DOMAIN -e php -o $DIRECTORY/dirsearch.txt
        echo "The results of dirsearch scan are stored in $DIRECTORY/dirsearch."   
    ;;    
    crt-only)
        echo "Start scanning using crt"
        curl "https://crt.sh/?q=$DOMAIN&output=json" -o $DIRECTORY/crt
        echo "The results of crt scan are stored in $DIRECTORY/crt"
    ;;

    *)
        echo "Start scanning using nmap"
        # nmap $DOMAIN > $DIRECTORY/nmap_result
        echo "The results of nmap scan are stored in $DIRECTORY/nmap"

        echo "Start scanning using dirsearch"
        dirsearch -u $DOMAIN -e php -o $DIRECTORY/dirsearch.txt
        echo "The results of dirsearch scan are stored in $DIRECTORY/dirsearch." 

        echo "Start scanning using crt"
        curl "https://crt.sh/?q=$DOMAIN&output=json" -o $DIRECTORY/crt
        echo "The results of crt scan are stored in $DIRECTORY/crt"
    ;;    

esac


    


