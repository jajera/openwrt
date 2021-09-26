uci set wireless."$WIFI_NETWORK"='wifi-iface';
uci set wireless."$WIFI_NETWORK".device=$WIFI_DEV;
uci set wireless."$WIFI_NETWORK".mode=$WIFI_MODE;
uci set wireless."$WIFI_NETWORK".network=$WIFI_NETWORK;
uci set wireless."$WIFI_NETWORK".ssid=$WIFI_SSID;
uci set wireless."$WIFI_NETWORK".encryption=$WIFI_ENCRYPT;
uci set wireless."$WIFI_NETWORK".key=$WIFI_KEY;
uci set wireless."$WIFI_NETWORK".channel=$WIFI_CHANNEL;
uci set wireless."$WIFI_NETWORK".isolate=$WIFI_ISOLATE;
uci set wireless."$WIFI_NETWORK".hidden=$WIFI_HIDE;
uci commit wireless;
wifi reload;
uci show wireless.$WIFI_NETWORK 2> /dev/null;