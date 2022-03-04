#  mariadb:
#    image: mariadb:10.4
#    restart: always
#    volumes:
#      - mariadb-data:/var/lib/mysql
#    environment:
#      MYSQL_ROOT_PASSWORD: qwerty
#    command: "mysqld --init-file /data/application/init.sql"
#    volumes:
#        - ./init.sql:/data/application/init.sql


#FROM mariadb:latest as builder

# That file does the DB initialization but also runs mysql daemon, by removing the last line it will only init
#RUN ["sed", "-i", "s/exec \"$@\"/echo \"not running $@\"/", "/usr/local/bin/docker-entrypoint.sh"]

# needed for intialization
#ENV MYSQL_ROOT_PASSWORD=root

#COPY setup.sql /docker-entrypoint-initdb.d/

# Need to change the datadir to something else that /var/lib/mysql because the parent docker file defines it as a volume.
# https://docs.docker.com/engine/reference/builder/#volume :
#       Changing the volume from within the Dockerfile: If any build steps change the data within the volume after
#       it has been declared, those changes will be discarded.
#RUN ["/usr/local/bin/docker-entrypoint.sh", "mysqld", "--datadir", "/initialized-db", "--aria-log-dir-path", "/initialized-db"]



FROM mariadb:latest

COPY --from=builder /initialized-db /var/lib/mysql


FROM mariadb:latest

ENV MYSQL_ROOT_PASSWORD="root"
#ENV MYSQL_DATABASE="imhere"

#ADD imhere.sql /tmp/imhere.sql

#RUN "mysql -u root --password="root" imhere < /tmp/imhere.sql"