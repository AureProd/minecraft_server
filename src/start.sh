#!/bin/bash

screen -dm -S server -L -Logfile /srv/logs/server.log bash -c "cd /srv/server; ./run.sh"

screen -S server -X colon "logfile flush 0^M"