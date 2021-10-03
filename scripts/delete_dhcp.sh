uci -q delete dhcp."$DHCP_NAME"
uci commit wireless;
wifi reload;
uci -q show wireless.$DHCP_NAME;