# openwrt

# initialization
BASE_URL='https://raw.githubusercontent.com/jajera/openwrt/main/scripts'

# initiate reboot
ssh root@192.168.1.1 $(curl -s $BASE_URL/init_reboot.sh)

# get uptime
ssh $USER@$ROUTER_IP $(curl -s $BASE_URL/get_uptime.sh)

# get hostname
ssh $USER@$ROUTER_IP $(curl -s $BASE_URL/get_hostname.sh)

# set hostname
NEW_HOSTNAME=OPENWRT00
ssh $USER@$ROUTER_IP "HOSTNAME=$NEW_HOSTNAME;$(curl -s $BASE_URL/set_hostname.sh)"

# get timezone
ssh $USER@$ROUTER_IP $(curl -s $BASE_URL/get_timezone.sh)

# set timezone (Manila)
NEW_TIMEZONE='PST-8'
NEW_ZONENAME='Asia/Manila'
ssh $USER@$ROUTER_IP "TIMEZONE=$NEW_TIMEZONE;ZONENAME=$NEW_ZONENAME;$(curl -s $BASE_URL/set_timezone.sh)"

# get interfaces
ssh $USER@$ROUTER_IP $(curl -s $BASE_URL/get_interfaces.sh)

# get interface details
QRY_INT='lan'
ssh $USER@$ROUTER_IP "INTERFACE=$QRY_INT;$(curl -s $BASE_URL/get_interface_details.sh)"

# new interface
NEW_INT_LABEL='guest'
NEW_INT_CLASS='device'
NEW_INT_TYPE='bridge'
NEW_INT_NAME='br-guest'
NEW_INT_PROTO='static'
NEW_INT_IPADDR='192.168.3.1'
NEW_INT_NETMASK='255.255.255.0'
ssh $USER@$ROUTER_IP "INT_LABEL=$NEW_INT_LABEL;INT_CLASS=$NEW_INT_CLASS;INT_TYPE=$NEW_INT_TYPE;INT_NAME=$NEW_INT_NAME;INT_PROTO=$NEW_INT_PROTO;INT_IPADDR=$NEW_INT_IPADDR;INT_NETMASK=$NEW_INT_NETMASK;$(curl -s $BASE_URL/new_interface.sh)"

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
ssh $USER@$ROUTER_IP "WIFI_DEV=$NEW_WIFI_DEV;WIFI_MODE=$NEW_WIFI_MODE;WIFI_NETWORK=$NEW_WIFI_NETWORK;WIFI_SSID=$NEW_WIFI_SSID;WIFI_ENCRYPT=$NEW_WIFI_ENCRYPT;WIFI_KEY=$NEW_WIFI_KEY;WIFI_CHANNEL=$NEW_WIFI_CHANNEL;WIFI_ISOLATE=$NEW_WIFI_ISOLATE;WIFI_HIDE=$NEW_WIFI_HIDE;$(curl -s $BASE_URL/new_interface.sh)"