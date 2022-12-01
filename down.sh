#!/bin/bash

if [ ! -f .env ]; then
    echo "No .env file found. Please create one."
    exit 1
else
    $INSTANCE_NAME=$(grep INSTANCE_NAME .env | cut -d '=' -f2)
fi

docker-compose --project-name server-$INSTANCE_NAME -f docker-compose.yml --env-file .env down