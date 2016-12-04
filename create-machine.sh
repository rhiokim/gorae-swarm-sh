#!/bin/bash

# Swarm mode using Docker Machine

#This configures the number of workers and managers in the swarm
managers=3
workers1=3
workers2=2
workers3=1
registry=1

# This creates the manager machines
echo "======> Creating $managers manager machines ...";
for node in $(seq 1 $managers);
do
    echo "======> Creating manager$node machine ...";
    docker-machine create -d virtualbox manager$node;
done

# This create worker machines
echo "======> Creating $workers1 worker machines ...";
for node in $(seq 1 $workers1);
do
    echo "======> Creating worker1-$node machine ...";
    docker-machine create -d virtualbox worker1-$node;
done

# This create worker machines
echo "======> Creating $workers2 worker machines ...";
for node in $(seq 1 $workers2);
do
    echo "======> Creating worker2-$node machine ...";
    docker-machine create -d virtualbox worker2-$node;
done

# This create worker machines
echo "======> Creating $workers3 worker machines ...";
for node in $(seq 1 $workers3);
do
    echo "======> Creating worker3-$node machine ...";
    docker-machine create -d virtualbox worker3-$node;
done

# This create registry machines
echo "======> Creating registry machines ...";
for node in $(seq 1 $registry);
do
    echo "======> Creating registry-$node machine ...";
    docker-machine create -d virtualbox registry-$node;
done

# This lists all machines created
docker-machine ls
