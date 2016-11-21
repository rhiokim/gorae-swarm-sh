#!/bin/bash

managers=3
workers1=3
workers2=2
workers3=1
containerName=gorae-swarm

for node in $(seq 1 $managers);
do
  echo "======> run gorae-swarm on manager$node node"
  eval $(docker-machine env manager$node)

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

for node in $(seq 1 $workers1);
do
  echo "======> run gorae-swarm on worker1-$node node"
  eval $(docker-machine env worker1-$node)

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

for node in $(seq 1 $workers2);
do
  echo "======> run gorae-swarm on worker2-$node node"
  eval $(docker-machine env worker2-$node)

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

for node in $(seq 1 $workers3);
do
  echo "======> run gorae-swarm on worker3-$node node"
  eval $(docker-machine env worker3-$node)

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
