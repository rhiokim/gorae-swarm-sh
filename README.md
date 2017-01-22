# Docker Swarm with Gorae
These are shell script for docker swarm mode with Gorae Project on Mac
It have some dependencies with Gorae Project

- `create-machine.sh` : create vm node based virtualbox
- `configure-swarm.sh` : join into swarm mode all of master and worker node
- `push-gorae-into-vm`: push the gorae into vm after build new gorae
- `push-gorae-swarm-into-vm`: push the gorae-swarm into vm after build new gorae-swarm
- `run-gorae-on-vm.sh` : run gorae container on vm nodes
- `run-gorae-swarm-on-vm.sh` : run gorae-swarm container on vm nodes
- `run-registry-on-vm.sh` : run docker registry container on vm
- `clean-gorae-swarm.sh` : remove gorae-swarm container inside VM node all of master and worker node
- `configure-swarm-leave.sh` : leave from swarm mode all of master and worker node
- `remove-machine.sh` : delete all of vm (manager1~3, worker1~3)
- `start-all.sh` : start all vm
- `stop-all.sh` : stop all vm
- `upgrade-machine.sh` : upgrade docker engine inside VM

## Structure

```
     * manager1 *- worker1-1
    /            \ worker1-2
   /             \ worker1-3
  /              \ worker1-4
 /
swarm *- manager2 *- worker2-1
 \                 \ worker2-2
  \                \ worker2-3
   \
     * manager3 *- worker3-1
                 \ worker3-2
registry-1
```
