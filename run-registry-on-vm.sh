registry=1
containerName=registry

for node in $(seq 1 $registry);
do
  echo "======> run registry on registry-$node node"
  eval $(docker-machine env registry-$node)

  # cleanup potential existing containers
  if [ -n "$(docker ps --filter="name=${containerName}" -aq)" ]; then
    docker rm -f ${containerName}
  fi

  # start new gorae
  docker run -dit \
    --restart=always \
    --name $containerName \
    -p 5000:5000 \
    registry:2
done
