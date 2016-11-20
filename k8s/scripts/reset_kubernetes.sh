#!/bin/bash

# reset kubernetes environment to start over again
kubeadm reset

# Run this command on each cluster member: master and nodes.
#
# To reinitialize master again with command: kubeadm init
# run those two commands before:
#
#		sudo systemctl daemon-reload
#		sudo systemctl restart kubelet.service
#
# To join old nodes to reinitiled master run also two commands above and
# then kubeadm join command on each node:
#
#		kubeadm join --token=<token_value> <master internal IP>
