#!/bin/bash

docker build -t docker-wal-replica .

docker run -p 5432:5432 --rm -v $(pwd)/db:/var/lib/pgsql:rw --env-file=env docker-wal-replica

