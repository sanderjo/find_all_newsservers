
echo $1
(sleep 0.3; echo "QUIT"; sleep 0.3; echo -e "QUIT\r\n"; sleep 5.3) | timeout 4  gnutls-cli $1 --insecure -p 563  2>&1 > bla_gnutls

#(sleep 0.3; echo "QUIT"; sleep 0.3; echo -e "QUIT\r\n"; sleep 0.3) | openssl s_client -connect $1:563 > bla_openssl 2>&1
#cat bla_gnutls | grep subject | awk -F\= '{ print $NF }'

cat bla_gnutls | grep -m 1 -Po "(?<=CN=)[^',]+" | head -1
cat bla_gnutls | grep -E "^20"
echo "----"

