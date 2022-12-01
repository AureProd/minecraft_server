#!/bin/bash

RED="\e[1;31m"
GREEN="\e[1;32m"
YELLOW="\e[1;33m"
RESET="\e[0m"

echo -e "${YELLOW}Restarting server...${RESET}"

./stop.sh

sleep 1

./start.sh

echo -e "${GREEN}Server restarted.${RESET}"