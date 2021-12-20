#!/bin/bash
url=$1

if [ ! -d "output" ];then
        mkdir output
fi
if [ ! -d "output/$url" ];then
        mkdir output/$url
fi
if [ ! -d "output/$url/subdomain" ];then
        mkdir output/$url/subdomain
fi

echo "[+] Harvesting subdomains with findomain..."
findomain -t $url | tee output/$url/subdomain/findomain.txt

echo "[+] Harvesting subdomains with subfinder..."
subfinder -d $url | tee output/$url/subdomain/subfinder.txt

echo "[+] Harvesting subdomains with amass..."
amass enum -d $url | tee output/$url/subdomain/amass.txt

echo "[+] Harvesting subdomains with assetfinder..."
assetfinder $url | tee output/$url/subdomain/assets.txt

echo "[+] Evaluating subdomains..."
cat output/$url/subdomain/findomain.txt output/$url/subdomain/subfinder.txt output/$url/subdomain/amass.txt output/$url/subdomain/assets.txt | sort -u | httprobe | tee output/$url/subdomain/final.txt
rm output/$url/subdomain/findomain.txt output/$url/subdomain/subfinder.txt output/$url/subdomain/amass.txt output/$url/subdomain/assets.txt
