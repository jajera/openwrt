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
QRY_INTERFACE='lan'
ssh $USER@$ROUTER_IP "INTERFACE=$QRY_INTERFACE;$(curl -s $BASE_URL/get_interface_details.sh)"
