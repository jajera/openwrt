uci -q delete wireless."$WIFI_NAME"
uci commit wireless;
wifi reload;
uci -q show wireless.$WIFI_NAME;