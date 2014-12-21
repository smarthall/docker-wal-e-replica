# Postgres WAL-E Replica

This docker image combines WAL-E and Postgres 9.3 to create a Docker image
capable of restoring from a WAL-E backup. Ths can be used for several things:

* Developers can use it to create local replicas from backups

* It can be used to test the integrity of your backups

* It can be used to create a temporary replica for large batch jobs

## Running the image

First create a file named `env` and put the following environment variables
inside one per line as `KEY=VALUE`:

* `AWS_ACCESS_KEY_ID`

* `AWS_SECRET_ACCESS_KEY`

* `WALE_S3_PREFIX`

Then simply run the container with:

    docker run -p 5432:5432 --env-file=env smarthall/docker-wal-e-replica

If you want to maintain the database over several containers you can mount the
postgres data directory onto your local machine by adding the following
argument to the `docker run` command.

    -v /location/on/host:/var/lib/pgsql:rw

This way you can stop the container and mount it again later with the same
database. Provided new WAL segments are available it will catch up to the
latest again.

## Building the image

    docker built -t docker-wal-e-replica .

