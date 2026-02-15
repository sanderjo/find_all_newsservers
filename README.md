Based on known newsservers, find all newsservers.

Method:
Of the known newssvers, find the IP addresses, create the unique subnets /24, and `zmap` those subnets to find all newssrvers.
Of those newsservers, find the TLS certificate and then the Welcome message

Method:

1. `sudo setcap cap_net_raw+ep $(which zmap)` to allow a normal user to use zmap
2. `RUN_ALL.sh` ... which will take 10 minutes
3. Check out the `.txt` files

Then you can work with the results. For example, to find newsservers in `81.171.92.x`:

```
$ cat clean_ip_certificate_welcome.txt | grep -e ^81.171.92 | head
81.171.92.180 news.extremeusenet.nl 200 Welcome to ExtremeUsenet 
81.171.92.181 news.usenetbucket.com 200 Welcome to Usenetbucket 
81.171.92.183 *.sslusenet.com 200 Welcome to Usenet 
81.171.92.185 xlned.com 200 news.xlned.com NNRP Service Ready - support@xlned.com 
81.171.92.186 pureusenet.nl 200 news.pureusenet.nl NNRP Service Ready - support@pureusenet.nl 
81.171.92.187 news4.usenet4u.nl 200 Welcome 
81.171.92.195 *.forteinc.com 200 Welcome to Forte Premium.  Please Authenticate. 
81.171.92.196 news.easynews.com 200 news.easynews.com Welcome! 
81.171.92.197 news.easynews.com 200 news.easynews.com Welcome! 
```
