#!/bin/bash

# Swarm mode using Docker Machine

#This configures the number of workers and managers in the swarm
managers=3
workers=3

# This creates the manager machines
echo "======> Deleting $managers manager machines ...";
for node in $(seq 1 $managers);
do
    echo "======> Deleting manager$node machine ...";
    docker-machine rm manager$node -y;
done

# This create worker machines
echo "======> Deleting $workers worker machines ...";
for node in $(seq 1 $workers);
do
    echo "======> Deleting worker$node machine ...";
    docker-machine rm worker$node -y;
done

# This lists all machines created
docker-machine ls
