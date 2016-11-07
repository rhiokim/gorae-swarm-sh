#!/bin/bash

managers=3
workers=3
containerName=gorae-swarm

for node in $(seq 1 $managers);
do
  echo "======> removing gorae-swarm on manager$node node"
  eval $(docker-machine env manager$node)

  # cleanup potential existing containers
  docker rm -f ${containerName}
  # if [ -n "$(sudo docker ps --filter="name=${containerName}" -aq)" ]; then
  #     sudo docker rm -f ${containerName}
  # fi
done

for node in $(seq 1 $workers);
do
  echo "======> removing gorae-swarm on worker$node node"
  eval $(docker-machine env worker$node)

  # cleanup potential existing containers
  docker rm -f ${containerName}
  # if [ -n "$(sudo docker ps --filter="name=${containerName}" -aq)" ]; then
  #     sudo docker rm -f ${containerName}
  # fi
done
