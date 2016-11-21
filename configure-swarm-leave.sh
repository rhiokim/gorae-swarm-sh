#!/bin/bash

managers=3
workers1=3
workers2=2
workers3=1

# remove swarm configure
for node in $(seq 1 $managers);
do
  echo "======> manager$node leave swarm as manager ..."
  docker-machine ssh manager$node \
    "docker swarm leave --force"
done

for node in $(seq 1 $workers1);
do
  echo "======> worker1-$node leave swarm as worker ..."
  docker-machine ssh worker1-$node \
    "docker swarm leave --force"
done

for node in $(seq 1 $workers2);
do
  echo "======> worker2-$node leave swarm as worker ..."
  docker-machine ssh worker2-$node \
    "docker swarm leave --force"
done

for node in $(seq 1 $workers3);
do
  echo "======> worker3-$node leave swarm as worker ..."
  docker-machine ssh worker3-$node \
    "docker swarm leave --force"
done
