#!/bin/bash

screen -dm -S server -L -Logfile /srv/logs/server.log bash -c "cd /srv/server; java -Xms$SERVER_MIN_RAM -Xmx$SERVER_MAX_RAM -jar /srv/spigot.jar nogui"

screen -S server -X colon "logfile flush 0^M"