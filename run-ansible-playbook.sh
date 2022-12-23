#!/bin/sh
export K8S_AUTH_API_KEY=$(cat /var/run/secrets/kubernetes.io/serviceaccount/token) 
echo "tempuser:x:$(id -u):$(id -g):,,,:${HOME}:/bin/bash" >> /etc/passwd
echo "tempuser:x:$(id -G | cut -d' ' -f 2)" >> /etc/group
id
ansible-playbook project/some-example-playbook.yml -vvv