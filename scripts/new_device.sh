uci set network."$DEV_LABEL".proto=$DEV_PROTO;
uci set network."$DEV_LABEL".device=$DEV_NAME;
uci set network."$DEV_LABEL".ipaddr=$DEV_IPADDR;
uci set network."$DEV_LABEL".netmask=$DEV_NETMASK;
uci commit network;
/etc/init.d/network restart;
uci -q show network.$DEV_LABEL;