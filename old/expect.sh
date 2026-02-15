expect -c '
  log_file bla;
  spawn openssl s_client -connect 162.55.179.12:563;
  expect -re "^20" { send "QUIT\r\n\r\n" };
  expect eof;
'

