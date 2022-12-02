#!/bin/bash

RED="\e[1;31m"
GREEN="\e[1;32m"
YELLOW="\e[1;33m"
RESET="\e[0m"

# get project folder path
PROJECT_PATH=$(readlink -f $0)
PROJECT_PATH=$(echo $PROJECT_PATH | sed 's/\/[^\/]*$//')

if [ ! -f $PROJECT_PATH/.env ]; then
    echo -e "${RED}No .env file found. Please create one.${RESET}"
    exit 1
else
    INSTANCE_NAME=$(grep INSTANCE_NAME $PROJECT_PATH/.env | cut -d '=' -f2)
fi

echo -e "${YELLOW}Stopping server...${RESET}"

docker-compose --project-name server-$INSTANCE_NAME -f $PROJECT_PATH/docker-compose.yml --env-file $PROJECT_PATH/.env down

echo -e "${GREEN}Server stopped.${RESET}"