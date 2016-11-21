# Docker Swarm with Gorae
These are shell script for docker swarm mode with Gorae Project on Mac
It have some dependencies with Gorae Project

1. `create-machine.sh` : create vm node based virtualbox
2. `configure-swarm.sh` : join into swarm mode all of master and worker node
3. `push-gorae-swarm-into-vm`: push the gorae-swarm into vm after build new gorae-swarm
4. `run-gorae-swarm-on-vm.sh` : run gorae-swarm container on vm nodes
- `clean-gorae-swarm.sh` : remove gorae-swarm container inside VM node all of master and worker node
- `configure-swarm-leave.sh` : leave from swarm mode all of master and worker node
- `remove-machine.sh` : delete all of vm (manager1~3, worker1~3)
- `start-all.sh` :
- `stop-all.sh` :

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
```
