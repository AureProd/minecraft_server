#!/bin/bash

# check if has files in /srv/server
if [ "$(ls -A /srv/server)" ]; then
    echo "Server already exists, skipping installation"
else
    echo "Installing server..."
    mv /srv/configs/* /srv/server
    mv /srv/start.sh /srv/server/start.sh

    echo "eula=true" > /srv/server/eula.txt
fi

/srv/server/start.sh

sleep 1

tail -f /srv/logs/server.log