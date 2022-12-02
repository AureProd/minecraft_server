#!/bin/bash

# get project folder path
PROJECT_PATH=$(readlink -f $0)
PROJECT_PATH=$(echo $PROJECT_PATH | sed 's/\/[^\/]*$//')

if [ ! -f $PROJECT_PATH/.env ]; then
    echo -e "${RED}No .env file found. Please create one.${RESET}"
    exit 1
else
    INSTANCE_NAME=$(grep INSTANCE_NAME $PROJECT_PATH/.env | cut -d '=' -f2)
fi

if [ "$1" == "" ]; then
    echo "Usage: $0 <command_txt>"
    exit 1
fi

docker exec spigot-$INSTANCE_NAME bash send_command.sh "$*"