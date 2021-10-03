uci set network."$DEV_LABEL"_int=$DEV_CLASS;
uci set network."$DEV_LABEL"_int.type=$DEV_TYPE;
uci set network."$DEV_LABEL"_int.name=$DEV_NAME;
uci commit network;
/etc/init.d/network restart;
uci -q show network.$DEV_LABEL;