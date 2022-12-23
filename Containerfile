FROM quay.io/swinches/ansible-openshift-ee:latest
COPY some-example-playbook /runner/project
COPY run-ansible-playbook.sh /runner/
RUN chmod +x /runner/run-ansible-playbook.sh
# Make Ansible happy with arbitrary UID/GID in OpenShift: https://major.io/2019/03/22/running-ansible-in-openshift-with-arbitrary-uids/
RUN chmod g=u /etc/passwd /etc/group
CMD /runner/run-ansible-playbook.sh