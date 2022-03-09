#!/bin/bash

SERVICE="wordpress"
NAME=$SERVICE"_c"

echo $NAME

echo -e "\\n\\n##################################################################\\n"\
     "                     REBUILDING WORDPRESS\\n"\
     "##################################################################\\n"

docker kill $(docker ps -f ancestor=$NAME)

docker rmi -f $(docker images $NAME -q)

docker build -t $NAME /home/alba/Desktop/docker/docker_temporary/Dockerfiles/$SERVICE

docker run -dt -p 8080:80 --network=cloud_atlas $NAME
