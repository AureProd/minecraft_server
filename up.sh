#!/bin/bash

docker-compose --project-name spigot-server -f docker-compose.yml --env-file .env up -d --build