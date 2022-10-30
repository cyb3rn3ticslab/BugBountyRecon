#!/bin/bash
DOMAIN=$1
DIRECTORY=${DOMAIN}_recon
TODAY=$(date)

echo "This scan was created on $TODAY"

echo "Creating Directory 
DIRECTORY. "
mkdir 
DIRECTORY

case $2 in 
    nmap-only)
        echo "[+] Harvesting scanning using nmap"
        # nmap $DOMAIN > DIRECTORY/nmap_result
        echo "The results of nmap scan are stored in $DIRECTORY/nmap"
    ;;    
    dirsearch-only)
        echo "[+] Harvesting directory using dirsearch"
        dirsearch -u $DOMAIN -e php -o $DIRECTORY/dirsearch.txt
        echo "The results of dirsearch scan are stored in $DIRECTORY/dirsearch."   
    ;;    
    crt-only)
        echo "[+] Scanning using crt"
        
        curl "https://crt.sh/?q=$DOMAIN&output=json" -o $DIRECTORY/crt
        echo "The results of crt scan are stored in $DIRECTORY/crt"
    ;;
    assetfinder-only)
        echo "[+] Harvesing subdomains with assetfinder....."
        assetfinder --subs-only $DIRECTORY >> $DIRECTORY/assetfinder/assetfinder-scan.txt
        echo "The results of crt scan are stored in $DIRECTORY/assetfinder"
    ;;
    *)
        echo "[+] Scanning using nmap"
        # nmap $DOMAIN > $DIRECTORY/nmap_result
        echo "The results of nmap scan are stored in $DIRECTORY/nmap"

        echo "[+] Harvesting directory using dirsearch"
        dirsearch -u $DOMAIN -e php -o $DIRECTORY/dirsearch.txt
        echo "The results of dirsearch scan are stored in $DIRECTORY/dirsearch." 

        echo "[+] Harvesing subdomains with assetfinder....."
        assetfinder --subs-only $DOMAIN >> $DIRECTORY/assetfinder/assetfinder-scan.txt
        echo "The results of crt scan are stored in $DIRECTORY/assetfinder"

        echo "[+] Scanning using crt"        
        curl "https://crt.sh/?q=$DOMAIN&output=json" -o $DIRECTORY/crt
        echo "The results of crt scan are stored in $DIRECTORY/crt"
    ;;    

esac


    


