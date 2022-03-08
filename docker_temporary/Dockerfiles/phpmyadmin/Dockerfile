#  phpmyadmin:
#    image: phpmyadmin/phpmyadmin:latest
#    ports:
#      - 8000:80
#    environment:
#      - PMA_ARBITRARY=1
#      - PMA_HOST=mariadb
#    depends_on:
#      - mariadb

##################

FROM phpmyadmin:latest
#FROM phpmyadmin:latest

#RUN apk add iputils
RUN apt-get update && apt-get upgrade -y && apt-get dist-upgrade -y && apt-get install -y iputils-ping


ENV MYSQL_ROOT_PASSWORD="rootpass"
ENV PMA_HOST="db_c"
ENV PMA_PASSWORD="rootpass"
