CONTAINER_ALREADY_STARTED="CONTAINER_ALREADY_STARTED_PLACEHOLDER"
if [ ! -e $CONTAINER_ALREADY_STARTED ]; then
    touch $CONTAINER_ALREADY_STARTED
    echo "-- First container startup --"
    sudo python /usr/src/app/cef_installer.py ${WORKSPACE_ID} ${PRIMARY_KEY}
else
    echo "-- Not first container startup --"
fi
