#!/bin/bash

managers=3
workers=3
containerName=gorae-swarm

cd $HOME/Works/my/gorae-swarm
npm run build

for node in $(seq 1 $managers);
do
  echo "======> installing gorae-swarm on manager$node node"
  eval $(docker-machine env manager$node)
  npm run docker:build

  # cleanup potential existing containers
  if [ -n "$(docker ps --filter="name=${containerName}" -aq)" ]; then
    docker rm -f ${containerName}
  fi

  # start new gorae-swarm
  docker run -dit \
    --restart=always \
    --name $containerName \
    -p 8082:8082 \
    -v /var/run/docker.sock:/var/run/docker.sock \
    gorae-swarm:latest
done

for node in $(seq 1 $workers);
do
  echo "======> installing gorae-swarm on worker$node node"
  eval $(docker-machine env worker$node)
  npm run docker:build

  # cleanup potential existing containers
  if [ -n "$(docker ps --filter="name=${containerName}" -aq)" ]; then
    docker rm -f ${containerName}
  fi

  # start new gorae-swarm
  docker run -dit \
    --restart=always \
    --name $containerName \
    -p 8082:8082 \
    -v /var/run/docker.sock:/var/run/docker.sock \
    gorae-swarm:latest
done
