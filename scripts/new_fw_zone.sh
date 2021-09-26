uci set firewall."$FW_ZONE_NAME"='zone'
uci set firewall."$FW_ZONE_NAME".name=$FW_ZONE_NAME
uci set firewall."$FW_ZONE_NAME".network=$FW_ZONE_NETWORK
uci set firewall."$FW_ZONE_NAME".input=$FW_ZONE_INPUT
uci set firewall."$FW_ZONE_NAME".output=$FW_ZONE_OUTPUT
uci set firewall."$FW_ZONE_NAME".forward=$FW_ZONE_FORWARD