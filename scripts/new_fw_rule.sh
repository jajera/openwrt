uci set firewall."${$FW_RULE_ID}"='rule';
uci set firewall."${$FW_RULE_ID}".name="${$FW_RULE_NAME}";
uci set firewall."${$FW_RULE_ID}".src="${$FW_RULE_SRC}";
uci set firewall."${$FW_RULE_ID}".dest_port="${$FW_RULE_DEST_PORT}";
uci set firewall."${$FW_RULE_ID}".proto=$(($FW_RULE_DEST_PROTO));
uci set firewall."${$FW_RULE_ID}".target="${$FW_RULE_DEST_TARGET}";
uci commit firewall;
/etc/init.d/firewall restart;
uci -s show firewall."${$FW_RULE_ID}";