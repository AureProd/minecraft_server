#!/bin/bash

if [ ! -f .env ]; then
    echo "No .env file found. Please create one."
    exit 1
else
    export $(cat .env | xargs)
fi

if [ "$1" == "" ]; then
    echo "Usage: $0 <command_txt>"
    exit 1
fi

docker exec spigot_$INSTANCE_NAME bash mc_send_command.sh "$*"