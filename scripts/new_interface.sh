uci set network."$INT_LABEL"_int=$INT_CLASS;
uci set network."$INT_LABEL"_int.type=$INT_TYPE;
uci set network."$INT_LABEL"_int.name=$INT_NAME;
uci commit network;
/etc/init.d/network restart;
uci -q show network.$INT_LABEL;