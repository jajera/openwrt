uci -q delete network."$DEV_NAME"
uci commit network;
/etc/init.d/network restart;
uci -q show network.$DEV_NAME;