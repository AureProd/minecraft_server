#!/bin/bash

# check if has files in /srv/server
if [ "$(ls -A /srv/server)" ]; then
    echo "Server already exists, skipping installation"
else
    echo "Installing server..."

    mv /srv/run.sh /srv/server/run.sh
    mv /srv/start.sh /srv/server/start.sh

    echo "eula=true" > /srv/server/eula.txt

    if [ "$NEED_DEV_INSTALL" = "true" ]; then
        echo "Installing dev tools..."
        
        echo "allow-nether=false" >> /srv/server/server.properties
        echo "level-name=world" >> /srv/server/server.properties
        echo "gamemode=creative" >> /srv/server/server.properties
        echo "difficulty=normal" >> /srv/server/server.properties
        echo "spawn-monsters=false" >> /srv/server/server.properties
        echo "level-type=flat" >> /srv/server/server.properties
        echo "spawn-animals=false" >> /srv/server/server.properties
        echo "motd=A development server" >> /srv/server/server.properties

        echo "settings:" >> /srv/server/bukkit.yml
        echo "  allow-end: false" >> /srv/server/bukkit.yml
    fi
fi

/srv/server/start.sh

sleep 1

tail -f /srv/logs/server.log