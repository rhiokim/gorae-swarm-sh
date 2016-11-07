#!/bin/bash

# Swarm mode using Docker Machine

#This configures the number of workers and managers in the swarm
managers=3
workers=3

# This creates the manager machines
echo "======> Creating $managers manager machines ...";
for node in $(seq 1 $managers);
do
    echo "======> Creating manager$node machine ...";
    docker-machine create -d virtualbox manager$node;
done

# This create worker machines
echo "======> Creating $workers worker machines ...";
for node in $(seq 1 $workers);
do
    echo "======> Creating worker$node machine ...";
    docker-machine create -d virtualbox worker$node;
done

# This lists all machines created
docker-machine ls
