#!/bin/bash

# Swarm mode using Docker Machine

#This configures the number of workers and managers in the swarm
managers=3
workers1=3
workers2=2
workers3=1
registry=1

# This stop worker machines
echo "======> Stop $workers3 worker machines ...";
for node in $(seq 1 $workers3);
do
    echo "======> Stop worker3-$node machine ...";
    docker-machine stop worker3-$node;
done

# This stop worker machines
echo "======> Stop $workers2 worker machines ...";
for node in $(seq 1 $workers2);
do
    echo "======> Stop worker2-$node machine ...";
    docker-machine stop worker2-$node;
done

# This stop worker machines
echo "======> Stop $workers1 worker machines ...";
for node in $(seq 1 $workers1);
do
    echo "======> Stop worker1-$node machine ...";
    docker-machine stop worker1-$node;
done

# This stops the manager machines
echo "======> Stop $managers manager machines ...";
for node in $(seq 1 $managers);
do
    echo "======> Stop manager$node machine ...";
    docker-machine stop manager$node;
done

# This stop registry machines
echo "======> Start registry machines ...";
for node in $(seq 1 $registry);
do
    echo "======> Start registry-$node machine ...";
    docker-machine stop registry-$node;
done

# This lists all machines stopd
docker-machine ls
