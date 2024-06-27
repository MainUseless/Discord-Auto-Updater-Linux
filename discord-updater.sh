#!/bin/bash
if pgrep -x "discord" > /dev/null; then
    echo "Discord is running"
else
    echo "Discord is not running"
    newVersion=$(curl -s "https://discord.com/api/download?platform=linux&format=deb" | grep -oP '(?<=discord-)[0-9.]+(?=.deb)' | head -n 1)
    sed -i 's/"[0-9.]*"/"'"$newVersion"'"/' /opt/discord/resources/build_info.json
    /usr/bin/discord
fi

# change the permission of the file and the directory enable read and execute 
# /opt/discord/resources & /opt/discord/resources/build_info.json
# can change the execute command in /usr/bin/discord to the path of this executable to run the script
# any time you start discord