uci set network."$INT_LABEL"_int=$INT_CLASS
uci set network."$INT_LABEL"_int.type=$INT_TYPE
uci set network."$INT_LABEL"_int.name=$INT_NAME
uci set network."$INT_LABEL"='interface'
uci set network."$INT_LABEL".proto=$INT_PROTO
uci set network."$INT_LABEL".device=$INT_NAME
uci set network."$INT_LABEL".ipaddr=$INT_IPADDR
uci set network."$INT_LABEL".netmask=$INT_NETMASK
uci commit network
/etc/init.d/network restart