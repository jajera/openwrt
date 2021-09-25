echo $(cat /etc/config/system | grep "option timezone" | cut -d "'" -f 2);
echo $(cat /etc/config/system | grep "option zonename" | cut -d "'" -f 2);