
# Ansible execution environment for openshift 

The purpose of this is to create a container image that has baked in python, pip, all ansible dependencies, and ansible itself - such that the playbook can be run inside the environment rather than on a developer desktop.

## Build Execution Environment

Builds an image with all ansible prereqs:

```
ansible-builder build -t quay.io/swinches/ansible-openshift-ee -v 1
```

## Build Execution Environment with Playbooks

Extend the execution environment by adding the playbooks into the image

```
buildah bud -t quay.io/swinches/whatever-ansible-playbooks:latest -f Containerfile
```

Playbook relies on:
https://docs.ansible.com/ansible/latest/collections/kubernetes/core/k8s_module.html

## Running the playbook

The intention is to run this as a kubernetes job
The token will be passed to the container: K8S_AUTH_API_KEY, taken from the serviceaccount secret
Any other required files should be provided externally via a secret.

