uci set system.@system[0].timezone=$TIMEZONE;
uci commit system;
/etc/init.d/system restart;
echo $(date +%Z);