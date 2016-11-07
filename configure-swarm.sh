#!/bin/bash

managers=3
workers=3

# initialize swarm mode and create a manager
echo "======> Initializing first swarm manager ..."
docker-machine ssh manager1 "docker swarm init --listen-addr $(docker-machine ip manager1) --advertise-addr $(docker-machine ip manager1)"

# get manager and worker tokens
export manager_token=`docker-machine ssh manager1 "docker swarm join-token manager -q"`
export worker_token=`docker-machine ssh manager1 "docker swarm join-token worker -q"`

for node in $(seq 2 $managers);
do
  echo "======> manager$node joining swarm as manager ..."
  docker-machine ssh manager$node \
    "docker swarm join \
    --token $manager_token \
    --listen-addr $(docker-machine ip manager$node) \
    --advertise-addr $(docker-machine ip manager$node) \
    $(docker-machine ip manager1)"
done

# workers join swarm
for node in $(seq 1 $workers);
do
  echo "======> worker$node joining swarm as worker ..."
  docker-machine ssh worker$node \
    "docker swarm join \
    --token $worker_token \
    --listen-addr $(docker-machine ip worker$node) \
    --advertise-addr $(docker-machine ip worker$node) \
    $(docker-machine ip manager1):2377"
done

# show members of swarm
docker-machine ssh manager1 "docker node ls"
