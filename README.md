# iti-final-project

# Description

- Installing Docker and Minikube using Ansible
- Deploying Jenkins and Nexus using Terraform
- Building a CI pipeline to build a simple Node.js application and push the image to Nexus private repo
- Building a CD pipeline to deploy the application on a minikube cluster


# Getting Started

## Ansible

> Use the following command to run the ansible playbook

```bash
$ ansible-playbook -i ansible/hosts ansible/playbook.yaml 
```

## Terraform

> Run the following commands to provision Jenkins and Nexus using Terraform:

```bash
$ terraform init
$ terraform apply --var-file=vars.tfvars
```


> Now, head to your browser and open Jenkins and Nexus using the NodePort 

## Nexus

> Create a docker-hosted repo and give it an HTTP connection port

## Jenkins

### Configure Jenkins to use the minikube cluster

> 1. Install the Kubernetes plugin on Jenkins form 'Manage Plugins'

> 2. Add the kubeconfig file as a credential of type secret file.

> 3. From 'Configure Nodes and Clouds', configure Jenkins to use the kubeconfig you just created to connect to the cluster

> 4. Create a CI pipeline to run the CI Jenkinsfile

> 5. Create a CD pipeline to run the CD Jenkinsfile

## Application

> To connect to the application, use the IP of the minikube with the nodePort of the service


# Technologies

<p align="center">
<img src="https://www.vectorlogo.zone/logos/docker/docker-icon.svg"/>
<img src="https://www.vectorlogo.zone/logos/kubernetes/kubernetes-icon.svg">
<img src="https://www.vectorlogo.zone/logos/jenkins/jenkins-icon.svg"/>
<img src="https://www.vectorlogo.zone/logos/terraformio/terraformio-icon.svg"/>
<img src="https://www.vectorlogo.zone/logos/ansible/ansible-icon.svg"/>
<img src="https://www.vectorlogo.zone/logos/gnu_bash/gnu_bash-icon.svg"/>
</p>


