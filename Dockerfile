FROM mongo:3.6

EXPOSE 27017 27017

COPY mongod.conf /etc/mongod.conf
COPY password.sh /docker-entrypoint-initdb.d/
