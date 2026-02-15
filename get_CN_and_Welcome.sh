echo $1
echo "QUIT\r\n" | openssl s_client -connect $1:563 2>&1  | grep -E ^subject  | awk -F\= '{ print $NF }'

#expect -c 'spawn openssl s_client -connect "$1":563 -quiet; expect "*20*" { send "QUIT\r\n" }; expect eof' | grep -E ^20 | head -1



expect <<EOF | grep -E "^20" | head -1
  spawn openssl s_client -connect $1:563 -quiet
  set timeout 5
  expect {
    "*20*"  { send "QUIT\r\n"; exp_continue }
    eof     { exit }
    timeout { exit }
  }

EOF


echo "-----"
