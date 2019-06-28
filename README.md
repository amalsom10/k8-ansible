# K8-Redis
Project to setup redis in kubernetes with a redis frontend(UI)
## Getting Started
We can divide the project to sub-topics.
1. Setup the kubernetes cluster
2. Deploy the application 
3. Create namespace stage and prod
4. Setup the Ingress controller to route the traffic 
5. Load test and autoscale 

### 1. Setup the kubernetes cluster
I used ansible to setup the complete arch including the k8 and application side. Please use [link](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html#installing-the-control-machine) to config ansible in local 

Also please confirm that the access details (username and IP adress) of master and worker updated in hosts file of ansible

Please follow the below steps to setup kubernetes cluster:
```
ansible-playbook -i hosts create_user.yml
ansible-playbook -i hosts kube-dependencies.yml
ansible-playbook -i hosts master.yml
ansible-playbook -i hosts workers.yml
```

### 2. Deploy the application
```
ansible-playbook -i hosts app-deployment.yml
```

### 3. Create namespace stage and prod
```
ansible-playbook -i hosts create-namespace.yml
```

### 4. Setup the Ingress controller to route the traffic 
```
ansible-playbook -i hosts nginx-ingress/nginx_ingress_setup.yml
```

### 5. Load test and autoscale
To configure the autoscaler please use below playbook

```
ansible-playbook -i hosts auto-scaler/auto-scale.yml
```

To increase the load in the redis pods, run the below script from local
```
bash load-checker/scale.sh
```


## Single-Run
You can use the below script to setup the complete infra in single run, before that please confirm you have proper entries in hosts file of ansible in local

```
bash single-wrapper/single-wrapper.sh
```

## Built With
- Ansible
- google repo for k8
- google default redis images 
- nginx-ingress 
- bash
