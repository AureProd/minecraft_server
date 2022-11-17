#!/bin/bash

# check if 2 arguments are given
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <min_ram> <max_ram>"
    exit 1
fi

MIN_RAM=$1
MAX_RAM=$2

# check if has files in /srv/server
if [ "$(ls -A /srv/server)" ]; then
    echo "Server already exists, skipping installation"
else
    echo "Installing server..."
    mv /srv/configs/* /srv/server

    echo "eula=true" > /srv/server/eula.txt
fi

screen -dm -S server -L -Logfile /srv/logs/server.log /srv/mc_start.sh $MIN_RAM $MAX_RAM

screen -S server -X colon "logfile flush 0^M"

sleep 1

tail -f /srv/logs/server.log