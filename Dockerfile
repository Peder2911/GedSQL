
FROM kartoza/postgis

ENV POSTGRES_USER "mihai"
ENV POSTGRES_PASS "letmein"
ENV POSTGRES_DBNAME "ged"

RUN apt install -y unzip

RUN mkdir /srv/data

RUN mkdir /docker-entrypoint-initdb.d

ADD http://ucdp.uu.se/downloads/ged/ged191-sql.zip /srv/data
RUN unzip /srv/data/ged191-sql.zip -d /srv/data
RUN mv /srv/data/ged191-pgsql.sql /docker-entrypoint-initdb.d/populate.sql

