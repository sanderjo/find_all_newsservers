
echo $1
(echo "QUIT"; sleep 0.3; echo -e "QUIT\r\n") | timeout 4  gnutls-cli $1 --insecure -p 563  2>&1 > bla
cat bla | grep -m 1 -Po "(?<=CN=)[^',]+" | head -1
cat bla | grep -E "^200"
echo "----"

