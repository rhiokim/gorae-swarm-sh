# Docker Swarm with Gorae
These are shell script for docker swarm mode with Gorae Project on Mac
It have some dependencies with Gorae Project

- `clean-gorae-swarm.sh` : remove gorae-swarm container inside VM node all of master and worker node
- `configure-swarm-leave.sh` : leave from swarm mode all of master and worker node
- `configure-swarm.sh` : join into swarm mode all of master and worker node
- `create-machine.sh` : create vm node based virtualbox
- `remove-machine.sh` : delete all of vm (manager1~3, worker1~3)
- `run-gorae-swarm-local.sh` : run gorae-swarm container on vm nodes
