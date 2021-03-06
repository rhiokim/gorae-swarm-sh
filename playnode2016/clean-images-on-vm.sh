#!/bin/bash

managers=3
workers1=3
workers2=2
workers3=1
imageName=$1

for node in $(seq 1 $managers);
do
  echo "======> removing gorae on manager$node node"
  eval $(docker-machine env manager$node)

  # cleanup potential existing containers
  docker rmi -f ${imageName}
  # docker rm -f ${containerName}
  # if [ -n "$(sudo docker ps --filter="name=${containerName}" -aq)" ]; then
  #     sudo docker rm -f ${containerName}
  # fi
done

for node in $(seq 1 $workers1);
do
  echo "======> removing gorae on worker1-$node node"
  eval $(docker-machine env worker1-$node)

  # cleanup potential existing containers
  docker rmi -f ${imageName}
  # docker rm -f ${containerName}
  # if [ -n "$(sudo docker ps --filter="name=${containerName}" -aq)" ]; then
  #     sudo docker rm -f ${containerName}
  # fi
done

for node in $(seq 1 $workers2);
do
  echo "======> removing gorae on worker2-$node node"
  eval $(docker-machine env worker2-$node)

  # cleanup potential existing containers
  docker rmi -f ${imageName}
  # docker rm -f ${containerName}
  # if [ -n "$(sudo docker ps --filter="name=${containerName}" -aq)" ]; then
  #     sudo docker rm -f ${containerName}
  # fi
done

for node in $(seq 1 $workers3);
do
  echo "======> removing gorae on worker3-$node node"
  eval $(docker-machine env worker3-$node)

  # cleanup potential existing containers
  docker rmi -f ${imageName}
  # docker rm -f ${containerName}
  # if [ -n "$(sudo docker ps --filter="name=${containerName}" -aq)" ]; then
  #     sudo docker rm -f ${containerName}
  # fi
done
