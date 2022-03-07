#!/bin/bash

# VARIABLES

FOLDER='/home/alba/Desktop/docker/docker_temporary'

DATABASE='db_c'
NGINX='nginx_c'
DB_ADMIN='phpmyadmin_c'
WORDPRESS='wordpress_c'

NETWORK='cloud_atlas'


# DESTROY

echo -e '\n\n##################################################################\n'\
     '                        DEEEEEEESTROYIIIIIIING\n'\
     '##################################################################\n'

docker kill $(docker ps -q)
docker rmi -f $(docker images -q)
docker system prune -a
docker network rm $NETWORK


# BUILD

echo -e "\\n\\n##################################################################\\n"\
     "                           BUILD STARTED\\n"\
     "##################################################################\\n"

echo ""
docker build -t $DATABASE $FOLDER/Dockerfiles/mariadb
docker build -t $NGINX $FOLDER/Dockerfiles/nginx
docker build -t $DB_ADMIN $FOLDER/Dockerfiles/phpmyadmin
#docker build -t WORDPRESS $FOLDER/Dockerfiles/mariadb/Dockerfile

echo "BUILD FINISHED"

# CREATE

echo -e "\\n\\n##################################################################\\n"\
     "                           CREATING THE NETWORK\\n"\
     "##################################################################\\n"

docker network create $NETWORK

echo -e "\\n\\n##################################################################\\n"\
     "                   STARTING TO RUN THE CONTAINERS\\n"\
     "##################################################################\\n"

docker run -dt -p 3306:3306 --network=$NETWORK $DATABASE
docker run -dt -p 80:80 --network=$NETWORK $NGINX
docker run -dt -p 9000:9000 -p 8080:80 --network=$NETWORK $DB_ADMIN

echo -e "\nFINISHED?" 
