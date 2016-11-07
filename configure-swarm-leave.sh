#!/bin/bash

managers=3
workers=3

# remove swarm configure
for node in $(seq 1 $managers);
do
  echo "======> manager$node leave swarm as manager ..."
  docker-machine ssh manager$node \
    "docker swarm leave --force"
done

for node in $(seq 1 $workers);
do
  echo "======> worker$node leave swarm as worker ..."
  docker-machine ssh worker$node \
    "docker swarm leave --force"
done
