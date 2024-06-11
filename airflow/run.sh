
echo "docker run -it \
    -e HOST_USERNAME=$(whoami) \
    -p 8080:8080 \
    ash_airflow /bin/bash"
docker run -it \
    --rm \
    --name ash-airflow \
    -e HOST_USERNAME=$(whoami) \
    -v /home/ashwin/workdir:/workdir \
    -p 8080:8080 \
    ash_airflow /bin/bash


# --rm \ --removes container when docker is exited
# --name ashwin-ubuntu  --name of the container. if no name is provided docker gives a name
# -p 8888:8888 -- access port 8888 of docker
# -e HOST_USERNAME -- in this case this is passed to entrypoint for user creation
# ash_ubuntu_image -- name of the image


# docker run -it \
#     -e HOST_USERNAME=$(whoami) \
#     ash_ubuntu_image /bin/bash



# (container_id=$(docker ps -aqf "image=ash_ubuntu_imager") && \
#  ( [ -z "$container_id" ] && docker run --name my-container -it ubuntu /bin/bash ) || \
#  ( docker start my-container && docker exec -it my-container /bin/bash )) || true
    
