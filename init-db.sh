#!/usr/bin/env bash

profile=$1
user_home="$(eval echo ~$USER)"

sleep 5

docker run \
            --rm \
            -t \
            -v $(pwd):/project \
            -w /project \
            --link $profile-restbucks-ordering-db:db \
            mysql \
            sh -c 'exec mysql -h"$DB_PORT_3306_TCP_ADDR" -P"$DB_PORT_3306_TCP_PORT" -uroot < src/main/resources/db/init.sql'
