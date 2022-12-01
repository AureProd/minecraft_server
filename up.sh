#!/bin/bash

RED="\e[1;31m"
GREEN="\e[1;32m"
YELLOW="\e[1;33m"
RESET="\e[0m"

if [ ! -f .env ]; then
    echo "No .env file found. Please create one."
    exit 1
else
    $INSTANCE_NAME=$(grep INSTANCE_NAME .env | cut -d '=' -f2)
fi

echo -e "${YELLOW}Starting server...${RESET}"

docker-compose --project-name server-$INSTANCE_NAME -f docker-compose.yml --env-file .env up -d --build

echo -e "${GREEN}Server started.${RESET}"