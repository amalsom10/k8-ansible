#!/bin/bash
echo -e "Run this script from the local machine where ansible is confrigured"
echo -e "Before that please update the host file of ansible with proper IP address and user details"
echo -e "Be in the root dir of repo and run this script ./single-wrapper/single-wrapper.sh"
ansible-playbook -i hosts create_user.yml
ansible-playbook -i hosts kube-dependencies.yml
ansible-playbook -i hosts master.yml
ansible-playbook -i hosts workers.yml
ansible-playbook -i hosts create-namespace.yml
ansible-playbook -i hosts app-deployment.yml
ansible-playbook -i hosts nginx-ingress/nginx_ingress_setup.yml
ansible-playbook -i hosts auto-scaler/auto-scale.yml

