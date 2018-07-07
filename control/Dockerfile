# Use an official Python runtime as a parent image
FROM ubuntu:latest

# Install python
RUN apt-get update && apt-get install software-properties-common -y \
      && apt-add-repository ppa:ansible/ansible -y \
      && apt-get update && apt-get install ansible python-pip -y \
      && rm -rf /var/lib/apt/lists/*

# Install python package
RUN pip install --upgrade pip==9.0.3 && pip install netaddr deepdiff

# Setup SSH access for remote systems
RUN mkdir -p /root/.ssh/
RUN chmod 0700 /root/.ssh
COPY ssh/id_rsa /root/.ssh/id_rsa
RUN chmod 0600 /root/.ssh/id_rsa
COPY ssh/config /root/.ssh/config
RUN chmod 0600 /root/.ssh/config

WORKDIR /var/ansible
