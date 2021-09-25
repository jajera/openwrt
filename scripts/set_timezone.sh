uci set system.@system[0].timezone=$NEW_TIMEZONE;
uci commit system;
echo $(date +%Z);