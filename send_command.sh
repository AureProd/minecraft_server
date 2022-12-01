#!/bin/bash

if [ ! -f .env ]; then
    echo "No .env file found. Please create one."
    exit 1
else
    $INSTANCE_NAME=$(grep INSTANCE_NAME .env | cut -d '=' -f2)
fi

if [ "$1" == "" ]; then
    echo "Usage: $0 <command_txt>"
    exit 1
fi

docker exec spigot_$INSTANCE_NAME bash send_command.sh "$*"