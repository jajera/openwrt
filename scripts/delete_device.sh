uci -q delete network."$INT_NAME"
uci commit network;
/etc/init.d/network restart;
uci -q show network.$INT_NAME;