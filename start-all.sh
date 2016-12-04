#!/bin/bash

# Swarm mode using Docker Machine

#This configures the number of workers and managers in the swarm
managers=3
workers1=3
workers2=2
workers3=1
registry=1

# This starts the manager machines
echo "======> Start $managers manager machines ...";
for node in $(seq 1 $managers);
do
    echo "======> Start manager$node machine ...";
    docker-machine start manager$node;
done

# This start worker machines
echo "======> Start $workers1 worker machines ...";
for node in $(seq 1 $workers1);
do
    echo "======> Start worker1-$node machine ...";
    docker-machine start worker1-$node;
done

# This start worker machines
echo "======> Start $workers2 worker machines ...";
for node in $(seq 1 $workers2);
do
    echo "======> Start worker2-$node machine ...";
    docker-machine start worker2-$node;
done

# This start worker machines
echo "======> Start $workers3 worker machines ...";
for node in $(seq 1 $workers3);
do
    echo "======> Start worker3-$node machine ...";
    docker-machine start worker3-$node;
done

# This start registry machines
echo "======> Start registry machines ...";
for node in $(seq 1 $registry);
do
    echo "======> Start registry-$node machine ...";
    docker-machine start registry-$node;
done

# This lists all machines startd
docker-machine ls
