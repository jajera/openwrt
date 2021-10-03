uci set network."$DEV_LABEL"='device';
uci set network."$DEV_LABEL".type=$DEV_TYPE;
uci set network."$INT_LABEL".name=$DEV_NAME;
uci commit network;
/etc/init.d/network restart;
uci -q show network.$DEV_LABEL;