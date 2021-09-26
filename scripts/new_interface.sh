uci set network."$NEW_INT_LABEL"_int=$NEW_INT_CLASS
uci set network."$NEW_INT_LABEL"_int.type=$NEW_INT_TYPE
uci set network."$NEW_INT_LABEL"_int.name=$NEW_INT_NAME
uci set network."$NEW_INT_LABEL"='interface'
uci set network."$NEW_INT_LABEL".proto=$NEW_INT_PROTO
uci set network."$NEW_INT_LABEL".device=$NEW_INT_NAME
uci set network."$NEW_INT_LABEL".ipaddr=$NEW_INT_IPADDR
uci set network."$NEW_INT_LABEL".netmask=$NEW_INT_NETMASK
uci commit network
/etc/init.d/network restart