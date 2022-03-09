## Liens des sujets:

### Inception
    https://cdn.intra.42.fr/pdf/pdf/45095/en.subject.pdf
    https://cdn.intra.42.fr/pdf/pdf/45096/fr.subject.pdf

### Cloud-1
    https://cdn.intra.42.fr/pdf/pdf/35452/en.subject.pdf
    https://cdn.intra.42.fr/pdf/pdf/35453/fr.subject.pdf

### Run docker without sudo post-installation
    https://docs.docker.com/engine/install/linux-postinstall/



## Etapes

1 - Setup l'inventaire avec les bonnes coordonnees (pour l'instant env de dev avec les coordonnees du vps, mais egalement de la vm locale CloudAtlas, et on devra modifier le playbook en fonction pour les tests)


2 - Identifier les differents elements a installer (cf. sujet d'Inception) + l'ordre
    * Un container MariaDB
    * Un container nginx
    * Un container wordpress
    * Un container phpmyadmin


Essayer de respecter le schema d'Inception: on tape sur le port 443/80, on arrive sur le container nginx, et en fonction de ce qu'on demande on est redirige vers les autres containers (soit celui de wordpress, soit celui de phpmyadmin) (Pour le fichier de conf de nginx je sais comment les faire, on pourra check ensemble)


Idees de comment faire ? 


3 - Regarder la stack LEMP a implementer
    * Update le systeme
    * 


4 - Regarder comment implementer cette stack avec Docker
    * nginx protips: fichier de conf nginx dans /etc/nginx/conf.d
                     pages html la ou on les configure mais sinon: /usr/share/nginx/html

    services:
  mywebapp:
    build: .
    ports:
      - "8005:8080"
https://blog.sylo.space/guide-to-install-nginx-php-mariadb-phpmyadmin-in-docker/


5 - Automatiser le deploiement de Docker avec Ansible

--- 

# Commandes Docker pour lancer les containers:

-p-> --publish

EXPOSE: le container ecoute sur le ou les port(s) X

docker network create --driver bridge web

docker exec -it xxx bash 

IMPORT:
docker exec -i docker_mariadb_1 mysql -uroot -pqwerty DB_NAME < your_local_db_dump.sql

EXPORT:
docker exec -i docker_mariadb_1 mysqldump -uroot -pqwerty DB_NAME > your_local_db_dump.sql

## nginx

docker build -t nginx .
docker run -dt -p 80:80 --network=web nginx

## mariadb

docker build -t mariadb .
docker run -dt -p 3306:3306 --network=web mariadb
