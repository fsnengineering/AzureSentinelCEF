CONTAINER_ALREADY_STARTED="CONTAINER_ALREADY_STARTED_PLACEHOLDER"
if [ ! -e $CONTAINER_ALREADY_STARTED ]; then
    touch $CONTAINER_ALREADY_STARTED
    echo "-- First container startup --"
#sudo ln -s /usr/bin/python3 /usr/bin/python
 #   mkdir /etc/opt/microsoft
 #   mkdir /etc/opt/microsoft/omsagent
 #   mkdir /etc/opt/microsoft/omsagent/$1
 #   mkdir /etc/opt/microsoft/omsagent/$1/conf
 #   mkdir /etc/opt/microsoft/omsagent/$1/conf/omsagent.d
    cd /usr/src/app
    wget https://raw.githubusercontent.com/Azure/Azure-Sentinel/master/DataConnectors/CEF/cef_installer.py
    sudo python /usr/src/app/cef_installer.py $1 $2
else
    echo "-- Not first container startup --"
fi
tail -f /dev/null
