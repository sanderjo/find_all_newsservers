cat subnets-ipv4.txt | awk '{ print "zmap " $1 "/24 -p 563 -o zmap-results/zmap-" $1 "---port563.csv" }' | sh

