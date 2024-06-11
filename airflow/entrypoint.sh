#!/bin/bash
# create a new user if username is passed
if [ ! -z "$HOST_USERNAME" ]; then
    useradd -m $HOST_USERNAME
    cd /home/$HOST_USERNAME
else
    cd /home/
fi


yes | airflow db init

airflow users create \
    --username admin \
    --firstname Ashwin \
    --lastname Alapakkam Kannan \
    --role Admin \
    --email ashwin.kannan3@gmail.com \
    --password admin

# Start the Airflow webserver, default port is 8080
exec airflow webserver -p 8080

exec "$@"