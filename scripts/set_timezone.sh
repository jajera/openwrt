uci set system.@system[0].timezone=$TIMEZONE;
uci set system.@system[0].zonename=$ZONENAME;
uci commit system;
/etc/init.d/system restart;
echo $(date +%Z);
echo $(cat /etc/config/system | grep "option zonename" | cut -d "'" -f 2);