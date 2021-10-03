# openwrt

# initialization
BASE_URL='https://raw.githubusercontent.com/jajera/openwrt/main/scripts'
USER='root'
ROUTER_IP='192.168.1.1'

# initiate reboot
ssh root@192.168.1.1 $(curl -s $BASE_URL/init_reboot.sh)

# get uptime
ssh $USER@$ROUTER_IP $(curl -s $BASE_URL/get_uptime.sh)

# get hostname
ssh $USER@$ROUTER_IP $(curl -s $BASE_URL/get_hostname.sh)

# set hostname
NEW_HOSTNAME=OPENWRT00
ssh $USER@$ROUTER_IP "HOSTNAME=\"$NEW_HOSTNAME\";$(curl -s $BASE_URL/set_hostname.sh)"

# get timezone
ssh $USER@$ROUTER_IP $(curl -s $BASE_URL/get_timezone.sh)

# set timezone (Manila)
NEW_TIMEZONE='PST-8'
NEW_ZONENAME='Asia/Manila'
ssh $USER@$ROUTER_IP "TIMEZONE=\"$NEW_TIMEZONE\";ZONENAME=\"$NEW_ZONENAME\";$(curl -s $BASE_URL/set_timezone.sh)"

# get interfaces
ssh $USER@$ROUTER_IP $(curl -s $BASE_URL/get_interfaces.sh)

# get interface details
QRY_INT='lan'
ssh $USER@$ROUTER_IP "INTERFACE=\"$QRY_INT\";$(curl -s $BASE_URL/get_interface_details.sh)"

uci set network."$INT_LABEL"_int=$INT_CLASS;
uci set network."$INT_LABEL"_int.type=$INT_TYPE;
uci set network."$INT_LABEL"_int.name=$INT_NAME;
uci commit network;
/etc/init.d/network restart;
uci -q show network.$INT_LABEL;

# new interface
NEW_INT_CLASS='device'
NEW_INT_TYPE='bridge'
NEW_INT_NAME='br-guest'
ssh $USER@$ROUTER_IP "INT_CLASS=\"$NEW_INT_CLASS\";INT_TYPE=\"$NEW_INT_TYPE\";INT_NAME=\"$NEW_INT_NAME\";$(curl -s $BASE_URL/new_interface.sh)"

# new wireless
NEW_WIFI_DEV='radio0'
NEW_WIFI_MODE='ap'
NEW_WIFI_NETWORK='guest'
NEW_WIFI_SSID='guest'
NEW_WIFI_ENCRYPT='psk-mixed'
NEW_WIFI_KEY='1234567890'
NEW_WIFI_CHANNEL='6'
NEW_WIFI_ISOLATE='1'
NEW_WIFI_HIDE='1'
ssh $USER@$ROUTER_IP "WIFI_DEV=\"$NEW_WIFI_DEV\";WIFI_MODE=\"$NEW_WIFI_MODE\";WIFI_NETWORK=\"$NEW_WIFI_NETWORK\";WIFI_SSID=\"$NEW_WIFI_SSID\";WIFI_ENCRYPT=\"$NEW_WIFI_ENCRYPT\";WIFI_KEY=\"$NEW_WIFI_KEY\";WIFI_CHANNEL=\"$NEW_WIFI_CHANNEL\";WIFI_ISOLATE=\"$NEW_WIFI_ISOLATE\";WIFI_HIDE=\"$NEW_WIFI_HIDE\";$(curl -s $BASE_URL/new_wireless.sh)"

# configure dhcp
NEW_DHCP_INT='guest'
NEW_DHCP_START='100'
NEW_DHCP_LIMIT='150'
NEW_DHCP_LEASE='1h'
ssh $USER@$ROUTER_IP "DHCP_INT=\"$NEW_DHCP_INT\";DHCP_START=\"$NEW_DHCP_START\";DHCP_LIMIT=\"$NEW_DHCP_LIMIT\";DHCP_LEASE=\"$NEW_DHCP_LEASE\";$(curl -s $BASE_URL/set_dhcp.sh)"

# new firewall zone
NEW_FW_ZONE_NAME='guest'
NEW_FW_ZONE_NETWORK='guest'
NEW_FW_ZONE_INPUT='REJECT'
NEW_FW_ZONE_OUTPUT='ACCEPT'
NEW_FW_ZONE_FORWARD='REJECT'
ssh $USER@$ROUTER_IP "FW_ZONE_NAME=\"$NEW_FW_ZONE_NAME\";FW_ZONE_NETWORK=\"$NEW_FW_ZONE_NETWORK\";FW_ZONE_INPUT=\"$NEW_FW_ZONE_INPUT\";FW_ZONE_OUTPUT=\"$NEW_FW_ZONE_OUTPUT\";FW_ZONE_FORWARD=\"$NEW_FW_ZONE_FORWARD\";$(curl -s $BASE_URL/new_fw_zone.sh)"

# new firewall forwarding
NEW_FW_FORWARDING_NAME='guest_wan'
NEW_FW_FORWARDING_SRC='guest'
NEW_FW_FORWARDING_DEST='wan'
ssh $USER@$ROUTER_IP "FW_FORWARDING_NAME=\"$NEW_FW_FORWARDING_NAME\";FW_FORWARDING_SRC=\"$NEW_FW_FORWARDING_SRC\";FW_FORWARDING_DEST=\"$NEW_FW_FORWARDING_DEST\";$(curl -s $BASE_URL/new_fw_forwarding.sh)"

# new firewall rule
NEW_FW_RULE_ID='guest_dns'
NEW_FW_RULE_NAME='Allow-DNS-Guest'
NEW_FW_RULE_SRC='guest'
NEW_FW_RULE_DEST_PORT='53'
NEW_FW_RULE_DEST_PROTO='tcp udp'
NEW_FW_RULE_DEST_TARGET='ACCEPT'
NEW_FW_RULE_DEST_FAMILY=''
ssh $USER@$ROUTER_IP "FW_RULE_ID=\"$NEW_FW_RULE_ID\";FW_RULE_NAME=\"$NEW_FW_RULE_NAME\";FW_RULE_SRC=\"$NEW_FW_RULE_SRC\";FW_RULE_DEST_PORT=\"$NEW_FW_RULE_DEST_PORT\";FW_RULE_DEST_PROTO=\"$NEW_FW_RULE_DEST_PROTO\";FW_RULE_DEST_TARGET=\"$NEW_FW_RULE_DEST_TARGET\";FW_RULE_DEST_FAMILY=\"$NEW_FW_RULE_DEST_FAMILY\";$(curl -s $BASE_URL/new_fw_rule.sh)"

NEW_FW_RULE_ID='guest_dhcp'
NEW_FW_RULE_NAME='Allow-DHCP-Guest'
NEW_FW_RULE_SRC='guest'
NEW_FW_RULE_DEST_PORT='67'
NEW_FW_RULE_DEST_PROTO='udp'
NEW_FW_RULE_DEST_TARGET='ACCEPT'
NEW_FW_RULE_DEST_FAMILY='ipv4'
ssh $USER@$ROUTER_IP "FW_RULE_ID=\"$NEW_FW_RULE_ID\";FW_RULE_NAME=\"$NEW_FW_RULE_NAME\";FW_RULE_SRC=\"$NEW_FW_RULE_SRC\";FW_RULE_DEST_PORT=\"$NEW_FW_RULE_DEST_PORT\";FW_RULE_DEST_PROTO=\"$NEW_FW_RULE_DEST_PROTO\";FW_RULE_DEST_TARGET=\"$NEW_FW_RULE_DEST_TARGET\";FW_RULE_DEST_FAMILY=\"$NEW_FW_RULE_DEST_FAMILY\";$(curl -s $BASE_URL/new_fw_rule.sh)"

# delete interface
DEL_INT_LABEL='guest_int'
ssh $USER@$ROUTER_IP "INT_LABEL=\"$DEL_INT_LABEL\";$(curl -s $BASE_URL/delete_interface.sh)"