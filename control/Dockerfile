# Use an official Python runtime as a parent image
FROM ubuntu:latest

RUN export DEBIAN_FRONTEND=noninteractive && apt-get update && \
	apt-get install -y openssh-server python3-pip && \
	rm -rf /var/lib/apt/lists/*

# Install python package
RUN pip3 install --upgrade pip==20.1 && \
	pip3 install ansible netaddr deepdiff

# Setup SSH access for remote systems
RUN mkdir -p /root/.ssh/
RUN chmod 0700 /root/.ssh
COPY ssh/id_rsa /root/.ssh/id_rsa
RUN chmod 0600 /root/.ssh/id_rsa
COPY ssh/config /root/.ssh/config
RUN chmod 0600 /root/.ssh/config

WORKDIR /var/ansible
