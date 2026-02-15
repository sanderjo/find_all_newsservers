Based on known newsservers, find all newsservers.

Method:
Of the known newssvers, find the IP addresses, create the unique subnets /24, and `zmap` those subnets to find all newssrvers.
Of those newsservers, find the TLS certificate and then the Welcome message

Method:

1. `sudo setcap cap_net_raw+ep $(which zmap)` to allow a normal user to use zmap
2. `RUN_ALL.sh` ... which will take 10 minutes
3. Check out the `.txt` files

