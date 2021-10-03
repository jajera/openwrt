uci -q delete network."$INT_LABEL"
uci commit network;
/etc/init.d/network restart;
uci -q show network.$INT_LABEL;