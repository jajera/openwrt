# openwrt

# initialization
BASE_URL='https://raw.githubusercontent.com/jajera/openwrt/main/scripts'

# reboot
ssh root@192.168.1.1 $(curl -s $BASE_URL/init_reboot.sh)
