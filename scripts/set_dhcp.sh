uci set dhcp."$DHCP_INT"='dhcp';
uci set dhcp."$DHCP_INT".interface=$DHCP_INT;
uci set dhcp."$DHCP_INT".start=$DHCP_START;
uci set dhcp."$DHCP_INT".limit=$DHCP_LIMIT;
uci set dhcp."$DHCP_INT".leasetime=$DHCP_LEASE;
uci commit dhcp;
/etc/init.d/dnsmasq restart;