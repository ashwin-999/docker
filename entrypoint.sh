#!/bin/bash
# create a new user if username is passed
if [ ! -z "$HOST_USERNAME" ]; then
    # Check if the home directory already exists
    if [ ! -d "/home/$HOST_USERNAME" ]; then
        # If it does not exist, create the user with the home directory
        useradd -m $HOST_USERNAME
    else
        # If it exists, create the user without the home directory
        useradd $HOST_USERNAME
    fi
    # Change to the user's home directory
    cd /home/$HOST_USERNAME
else
    cd /home/
fi
exec "$@"