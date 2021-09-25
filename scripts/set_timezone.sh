uci set system.@system[0].timezone=$NEW_TIMEZONE;
uci commit system;
/etc/init.d/system restart;
uci get system.@system[0].timezone;