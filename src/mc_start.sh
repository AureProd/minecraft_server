#!/bin/bash

# check if 2 arguments are given
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <min_ram> <max_ram>"
    exit 1
fi

MIN_RAM=$1
MAX_RAM=$2

cd /srv/server

java -Xms$MIN_RAM -Xmx$MAX_RAM -jar /srv/spigot.jar nogui