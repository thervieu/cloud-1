#   php:
#    image: php:7.2-fpm
#    volumes:
#      - /var/www/docker-study.loc/recipe-03/php:/var/www/myapp
#      - /var/www/docker-study.loc/recipe-03/docker/php.ini:/usr/local/etc/php/php.ini
#    depends_on:
#      - mariadb

##############

#    php:
#        build:
#            context: ./docker/php
#        ports:
#            - 9000:9000
#        volumes:
#            - ./:/srv/www/api
#            - ./docker/php/www.conf:/usr/local/etc/php-fpm.d/www.conf
#        environment:
#            MYSQL_USER: ${MYSQL_USER}
#            MYSQL_PASSWORD: ${MYSQL_PASSWORD}

##############

FROM bitnami/php-fpm:latest

ENV MYSQL_ROOT_PASSWORD=rootpass

# potentiellement besoin de monter un volume ? 
