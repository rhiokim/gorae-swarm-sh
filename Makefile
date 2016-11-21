init:
	@echo "========================================"
	@echo "= create virtual machine on virtualbox ="
	@echo "========================================"
	./create-machine.sh

rm-machine:
	./remove-machine.sh

swarm-init:
	./configure-swarm.sh

swarm-clear:
	./configure-swarm-leave.sh

push-gorae-swarm:
	./push-gorae-swarm-into-vm.sh

run-gorae-swarm:
	./run-gorae-swarm-on-vm.sh

clean-gorae-swarm:
	./clean-gorae-swarm.sh

stop-all:
	./stop-all.sh

start-all:
	./start-all.sh

push-gorae:
	./push-gorae-into-vm.sh

push-gorae-sample:
	./push-gorae-sample-service-into-vm.sh

run-gorae:
	./run-gorae-on-vm.sh
