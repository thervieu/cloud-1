#!/bin/bash

echo -e "\\n\\n##################################################################\\n"\
     "                     REBUILDING PHPMYADMIN\\n"\
     "##################################################################\\n"

docker kill $(docker ps -f ancestor=phpmyadmin_c)

docker rmi -f $(docker images -q)

docker build -t phpmyadmin_c /home/alba/Desktop/docker/docker_temporary/Dockerfiles/phpmyadmin

docker run -dt -p 8080:80 --network=cloud_atlas phpmyadmin_c
