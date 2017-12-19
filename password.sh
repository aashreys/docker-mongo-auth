#!/bin/bash

# Admin created from the base image entrypoint script
# https://github.com/docker-library/mongo/blob/master/3.6/docker-entrypoint.sh
MONGO_INITDB_ROOT_USERNAME=${MONGO_INITDB_ROOT_USERNAME:-"admin"}
MONGO_INITDB_ROOT_PASSWORD=${MONGO_INITDB_ROOT_PASSWORD:-"admin123"}

create_user() {
    MONGODB_APPLICATION_DATABASE=${1}
    MONGODB_APPLICATION_USER=${2}
    MONGODB_APPLICATION_PASS=${3}

    RET=1
    while [[ RET -ne 0 ]]; do
        echo "=> Waiting for confirmation of MongoDB service startup..."
        sleep 5
        mongo admin --eval "help" >/dev/null 2>&1
        RET=$?
    done

    echo "=> Creating a ${MONGODB_APPLICATION_DATABASE} database user and password in Mongo"
    mongo admin -u $MONGO_INITDB_ROOT_USERNAME -p $MONGO_INITDB_ROOT_PASSWORD << EOF
    echo "Using $MONGODB_APPLICATION_DATABASE database"
    use $MONGODB_APPLICATION_DATABASE
    db.createUser({user: '$MONGODB_APPLICATION_USER', pwd: '$MONGODB_APPLICATION_PASS', roles:[{role:'dbOwner', db:'$MONGODB_APPLICATION_DATABASE'}]})
EOF
}


if [ ! -f /data/db/.initialised ]; then
    create_user ${MONGO_APPDB_NAME:-"mvp"} ${MONGO_APPDB_USERNAME:-"mvpAppUser"} ${MONGO_APPDB_PASSWORD:-"mvpPass"}
    touch /data/db/.initialised
fi

echo "MongoDB configured successfully. You may now connect to the DB."