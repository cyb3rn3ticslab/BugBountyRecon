#!/bin/bash

DOMAIN=$1

if [ ! -d "thirdlevels" ]; then
    mkdir thirdlevels
fi   

if [ ! -d "scans" ]; then
    mkdir scans
fi  

echo "Gathering Subdomains using Sublist3r"
sublist3r -d $DOMAIN -o domain.txt

echo "Compiling third-level domains..."
cat domain-test.txt | grep -Po *(\w*\.\w*\.w*)$ | sort -u >> thrid-level.txt

echo "Gathering full third-level domains"
for doamin in $(cat third-level.txt); 
    do sublist3r -d $domain -o thirdlevels/$domain.txt; cat thirdlevels | sort -u >> domain.txt; 
done

echo "Probing for alive third-levels.... "
cat domain.txt | sort -u | httprobe -s -p https:443 | sed 's/https\?:\/\///' | tr -d ":443" > probed.txt

echo "Scanning for open ports...."
nmap -IL probed.txt -T5 -oA scans/scanned.txt

echo "Running Eyewitness"








