
echo $1

timeout 3 openssl s_client -connect $1:563 2>/dev/null  > bla
cat bla | grep -E "^subject=CN" | awk -F\= '{ print $NF }'
cat bla | grep -E "^20"


echo "----"

