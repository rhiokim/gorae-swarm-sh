#!/bin/bash

managers=3
workers1=3
workers2=2
workers3=1

# initialize swarm mode and create a manager
echo "======> Initializing first swarm manager ..."
docker-machine ssh manager1 "docker swarm init --listen-addr $(docker-machine ip manager1) --advertise-addr $(docker-machine ip manager1)"

# get manager and worker tokens
export manager_token1=`docker-machine ssh manager1 "docker swarm join-token manager -q"`
export worker_token1=`docker-machine ssh manager1 "docker swarm join-token worker -q"`

for node in $(seq 2 $managers);
do
  echo "======> manager$node joining swarm as manager ..."
  docker-machine ssh manager$node \
    "docker swarm join \
    --token $manager_token1 \
    --listen-addr $(docker-machine ip manager$node) \
    --advertise-addr $(docker-machine ip manager$node) \
    $(docker-machine ip manager1)"
done

export manager_token2=`docker-machine ssh manager2 "docker swarm join-token manager -q"`
export worker_token2=`docker-machine ssh manager2 "docker swarm join-token worker -q"`

export manager_token3=`docker-machine ssh manager3 "docker swarm join-token manager -q"`
export worker_token3=`docker-machine ssh manager3 "docker swarm join-token worker -q"`

# workers join swarm
for node in $(seq 1 $workers1);
do
  echo "======> worker1-$node joining swarm as worker ..."
  docker-machine ssh worker1-$node \
    "docker swarm join \
    --token $worker_token1 \
    --listen-addr $(docker-machine ip worker1-$node) \
    --advertise-addr $(docker-machine ip worker1-$node) \
    $(docker-machine ip manager1):2377"
done

# workers join swarm
for node in $(seq 1 $workers2);
do
  echo "======> worker2-$node joining swarm as worker ..."
  docker-machine ssh worker2-$node \
    "docker swarm join \
    --token $worker_token2 \
    --listen-addr $(docker-machine ip worker2-$node) \
    --advertise-addr $(docker-machine ip worker2-$node) \
    $(docker-machine ip manager2):2377"
done

# workers join swarm
for node in $(seq 1 $workers3);
do
  echo "======> worker3-$node joining swarm as worker ..."
  docker-machine ssh worker3-$node \
    "docker swarm join \
    --token $worker_token3 \
    --listen-addr $(docker-machine ip worker3-$node) \
    --advertise-addr $(docker-machine ip worker3-$node) \
    $(docker-machine ip manager3):2377"
done

# show members of swarm
# for node in $(seq 1 3);
# do
#   echo "======> show members of manager$node ..."
  eval $(docker-machine env manager$node)
  docker node ls
# done
