uci set network."$INT_NAME"='interface';
uci set network."$INT_NAME".proto=$INT_PROTO;
uci set network."$INT_NAME".device=$DEV_NAME;
uci set network."$INT_NAME".ipaddr=$INT_IPADDR;
uci set network."$INT_NAME".netmask=$INT_NETMASK;
uci commit network;
/etc/init.d/network restart;
uci -q show network.$INT_NAME;