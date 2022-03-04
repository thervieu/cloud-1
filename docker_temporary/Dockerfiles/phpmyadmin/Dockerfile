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

FROM phpmyadmin:fpm-alpine

RUN apk add iputils