cat all_certificate_and_welcome.txt | tr -cd '[:print:] \t\n' | tr "\n" " " | sed 's/-----/\n/g' | sed 's/^[[:space:]]*//' | grep " 20" | sort -n | tee clean_ip_certificate_welcome.txt

cat clean_ip_certificate_welcome.txt | sort -k2 > sorted_on_certificate_clean_ip_certificate_welcome.txt


