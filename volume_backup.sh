#!/bin/bash

GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'

if [ "$1" = '--restore' ]; then
  echo -e "${GREEN}restoring volumes${NC}"
  volume=`echo $2 | sed 's/.*\///g' | sed 's/_[[:digit:]]\{8\}_[[:digit:]]\{6\}.tar.gz//g'`
  file=`basename $2`
  path=`dirname $2`
  echo -e "${GREEN}restore volume $volume with file $file${NC}"
  docker run --rm \
    -v "$volume":/backup-volume \
    -v "$(pwd)/$path":/backup:ro \
    busybox \
    /bin/sh -c "rm -rf /backup-volume/* && tar -zxvf /backup/${file} -C /backup-volume"
  exit
fi

VOLUMES=$1

for volume in $VOLUMES; do
  echo -e "${GREEN}backup volume $volume${NC}"
  docker run --rm \
    -v "$volume":/backup-volume:ro \
    -v "$(pwd)/backups":/backup \
    busybox \
    tar -zcvf /backup/${volume}_$(date '+%Y%m%d_%H%M%S').tar.gz -C /backup-volume .
done
