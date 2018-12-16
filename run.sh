#!/bin/sh
docker rm -f proxy-service
docker run --name proxy-service -d \
  --publish 3128:3128 \
  --volume $PWD/squid/config/squid.conf:/etc/squid/squid.conf \
  --volume $PWD/squid/blacklist:/etc/squid/blacklist \
  --volume $PWD/squid/log/access.log:/var/log/squid/access.log \
  --volume $PWD/squid/cache:/var/spool/squid \
  sameersbn/squid:3.5.27
