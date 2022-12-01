#!/bin/bash

RED="\e[1;31m"
GREEN="\e[1;32m"
YELLOW="\e[1;33m"
RESET="\e[0m"

if [ ! -f .env ]; then
    echo -e "${RED}No .env file found. Please create one.${RESET}"
    exit 1
else
    $INSTANCE_NAME=$(grep INSTANCE_NAME .env | cut -d '=' -f2)
fi

echo -e "${YELLOW}Stopping server...${RESET}"

docker-compose --project-name server-$INSTANCE_NAME -f docker-compose.yml --env-file .env down

echo -e "${GREEN}Server stopped.${RESET}"