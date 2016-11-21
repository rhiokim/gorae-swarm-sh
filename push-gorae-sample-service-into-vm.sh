#!/bin/bash

managers=3
workers1=3
workers2=2
workers3=1

cd $HOME/Works/my/gorae-sample-service

for node in $(seq 1 $managers);
do
  echo "======> installing gorae-swarm on manager$node node"
  eval $(docker-machine env manager$node)
  npm run docker:build
  npm run docker:buildv1
done

for node in $(seq 1 $workers1);
do
  echo "======> installing gorae-swarm on worker1-$node node"
  eval $(docker-machine env worker1-$node)
  npm run docker:build
  npm run docker:buildv1
done

for node in $(seq 1 $workers2);
do
  echo "======> installing gorae-swarm on worker2-$node node"
  eval $(docker-machine env worker2-$node)
  npm run docker:build
  npm run docker:buildv1
done

for node in $(seq 1 $workers3);
do
  echo "======> installing gorae-swarm on worker3-$node node"
  eval $(docker-machine env worker3-$node)
  npm run docker:build
  npm run docker:buildv1
done
