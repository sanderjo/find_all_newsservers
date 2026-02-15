cat zmap-results/zmap-*port563.csv | awk '{ print "./get_CN_and_Welcome.sh " $1 }' | sh | tee all_certificate_and_welcome.txt
#cat zmap-results/zmap-*port563.csv | awk '{ print "./openssl_get_CN_and_Welcome.sh " $1 }' | sh

