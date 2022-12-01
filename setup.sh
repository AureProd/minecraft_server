#!/bin/bash

RED="\e[1;31m"
GREEN="\e[1;32m"
YELLOW="\e[1;33m"
RESET="\e[0m"

# check if .env file exist
if [ -f .env ]; then
    echo -e "${RED}The project is already initialized.${RESET}"
    exit 1
fi

echo -e "${YELLOW}Initializing of minecraft server...${RESET}"

# get project informations
echo -e "${YELLOW}Enter your instance name:${RESET}"
read INSTANCE_NAME

echo -e "${YELLOW}Creating .env file...${RESET}"

# create .env file 
cp .env.example .env

echo -e "${YELLOW}Replace string in the .env file...${RESET}"

# replace variables in .env file
sed -i "s/INSTANCE_NAME=.*/INSTANCE_NAME=$INSTANCE_NAME/g" .env

# generate server passwords
# sed -i "s/PASSWORD=.*/PASSWORD=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 30 | head -n 1)/g" .env

echo -e "${GREEN}The project initialized with success.${RESET}"