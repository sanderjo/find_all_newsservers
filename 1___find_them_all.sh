# get all known newsservers, and their ipv4 address:
lynx --dump https://www.appelboor.com/newsservers/newsservers-with-SSL---2025-10-28.csv | grep -v NOK |  awk -F\" '{ print "host -t a " $2 }' | sh | grep "has address"  > all-hosts-ipv4-resolved.txt

# from them, get the unique ipv4 subnets:
cat all-hosts-ipv4-resolved.txt | awk '{ print $NF }' | cut -d. -f1-3 | awk '{print $1".0"}' | sort -un | grep -vi addres > subnets-ipv4.txt

# OTHER SCRIPTS

# zmap to find servers responding on port 563

# of the responsing servers, get the CN and Welcome message

