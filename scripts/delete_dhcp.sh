uci -q delete dhcp."$DHCP_NAME"
uci commit dhcp;
/etc/init.d/dnsmasq restart;
uci -q show dhcp.$DHCP_NAME;