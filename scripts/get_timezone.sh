echo $(date +%Z);
echo $(cat /etc/config/system | grep "option zonename" | cut -d "'" -f 2);