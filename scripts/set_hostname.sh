uci set system.@system[0].hostname=$HOSTNAME;
uci commit system;
/etc/init.d/system restart;
uci get system.@system[0].hostname;