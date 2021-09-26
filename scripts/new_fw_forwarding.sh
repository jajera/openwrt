uci set firewall."$FW_FORWARDING_NAME"='forwarding';
uci set firewall."$FW_FORWARDING_NAME".src=$FW_FORWARDING_SRC;
uci set firewall."$FW_FORWARDING_NAME".dest=$FW_FORWARDING_DEST;
uci commit firewall;
/etc/init.d/firewall restart;
uci -s show firewall."$FW_FORWARDING_NAME";