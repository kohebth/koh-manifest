FROM mariadb:10.6.8

COPY datahub/src/main/resources/init/* /docker-entrypoint-initdb.d
