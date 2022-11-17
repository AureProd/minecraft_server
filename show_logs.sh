#!/bin/bash

if [ ! -f .env ]; then
    echo "No .env file found. Please create one."
    exit 1
else
    export $(cat .env | xargs)
fi

docker logs spigot_$INSTANCE_NAME -f