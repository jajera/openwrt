uci set network."$INT_LABEL"='interface';
uci set network."$INT_LABEL".proto=$INT_PROTO;
uci set network."$INT_LABEL".device=$DEV_NAME;
uci set network."$DEV_LABEL".ipaddr=$INT_IPADDR;
uci set network."$DEV_LABEL".netmask=$INT_NETMASK;
uci commit network;
/etc/init.d/network restart;
uci -q show network.$INT_LABEL;