#!/bin/bash

# Swarm mode using Docker Machine

#This configures the number of workers and managers in the swarm
managers=3
workers1=3
workers2=2
workers3=1
registry=1

# This removes the manager machines
echo "======> Deleting $managers manager machines ...";
for node in $(seq 1 $managers);
do
    echo "======> Deleting manager$node machine ...";
    docker-machine rm manager$node -y;
done

# This remove worker machines
echo "======> Deleting $workers1 worker machines ...";
for node in $(seq 1 $workers1);
do
    echo "======> Deleting worker1-$node machine ...";
    docker-machine rm worker1-$node -y;
done

# This remove worker machines
echo "======> Deleting $workers2 worker machines ...";
for node in $(seq 1 $workers2);
do
    echo "======> Deleting worker2-$node machine ...";
    docker-machine rm worker2-$node -y;
done

# This remove worker machines
echo "======> Deleting $workers3 worker machines ...";
for node in $(seq 1 $workers3);
do
    echo "======> Deleting worker3-$node machine ...";
    docker-machine rm worker3-$node -y;
done

# This remove registry machines
echo "======> Deleting registry machines ...";
for node in $(seq 1 $registry);
do
    echo "======> Deleting registry-$node machine ...";
    docker-machine rm registry-$node -y;
done

# This lists all machines created
docker-machine ls
