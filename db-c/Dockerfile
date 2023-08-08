FROM mysql:8.0.26

ENV MYSQL_ALLOW_EMPTY_PASSWORD=true

COPY ./sql/ /docker-entrypoint-initdb.d/

EXPOSE 3306

CMD ["mysqld"]
