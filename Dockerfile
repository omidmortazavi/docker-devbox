# Dockerfile for Ansible 
FROM ubuntu:18.04
ARG VERSION=3.6.5

RUN apt-get update

RUN \
    apt-get install -y \
        iproute2 \
        iputils-ping \
        openssh-client \
        python3.6 \
        python3-pip 

RUN \
    pip3 install \
        paramiko \
        ansible==2.9.0

RUN rm -rf /var/cache/apk/*

#RUN mkdir /etc/ansible/ /ansible
#RUN echo "[local]" >> /etc/ansible/hosts && \
#    echo "localhost" >> /etc/ansible/hosts

#RUN \
#  curl -fsSL https://releases.ansible.com/ansible/ansible-${VERSION}.tar.gz -o ansible.tar.gz && \
#  tar -xzf ansible.tar.gz -C ansible --strip-components 1 && \
#  rm -fr ansible.tar.gz /ansible/docs /ansible/examples /ansible/packaging

#RUN mkdir -p /ansible/playbooks
#WORKDIR /ansible/playbooks

#ENV ANSIBLE_GATHERING smart
#ENV ANSIBLE_HOST_KEY_CHECKING false
#ENV ANSIBLE_RETRY_FILES_ENABLED false
#ENV ANSIBLE_ROLES_PATH /ansible/playbooks/roles
#ENV ANSIBLE_SSH_PIPELINING True
#ENV PATH /ansible/bin:$PATH
#ENV PYTHONPATH /ansible/lib

#ENTRYPOINT ["ansible-playbook"]