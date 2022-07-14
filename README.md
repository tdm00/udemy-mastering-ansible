# Udemy Mastering Ansible Course

I recently purchased the [Udemy Mastering Ansible Course](https://www.udemy.com/mastering-ansible/learn/v4/). The course instructor mentions that he is using a Docker environment for the exercises, however I wasn't able to find a copy of this configuration to use. While there is a [Vagrant](https://www.vagrantup.com) file provided, I'd prefer not to install [VMware Fusion](https://www.vmware.com/products/fusion.html) or [VirtualBox](https://www.virtualbox.org) if I can avoid it and already have [Docker for macOS](https://www.docker.com/docker-mac) installed.

## Course Topology
The topology of the course, provided by the instructor, is included in the [Topology.pdf](Topology.pdf) file within this repository.

## Requirements
To make use of this repository you'll need the following software.
- macOS 10.13.5, tested on 12.4 (Monterey)
- Docker for macOS 18.05+, tested on 20.10.14, Docker Desktop 4.8.2

**Note:** I have only tested this on the Mac, but believe it should also work on a Linux system. For my Windows friends you may need to make modifications to the Dockerfile in the control and base directories. I don't have access to a Windows system to test.

## Getting Started
1. [Clone the repository](https://help.github.com/articles/cloning-a-repository/) to your machine
2. Install [Docker for macOS](https://www.docker.com/docker-mac), if you haven't already
3. Start Docker for macOS so that it is running
4. Open a terminal session and change to the directory on your machine where you cloned the repository
5. Build and start the environment:

    `docker-compose up --build -d`

6. Connect to the Control Machine container

    `docker container exec -it udemy-mastering-ansible_control_1 bash`

7. Verify the Control Machine container is able to communicate with the Managed Node containers

    `ansible all -m ping`

**Note:** the `ansible` directory on your host will be mounted to the Control Machine container under `/var/ansible`. Any changes you make on your host to the `ansible` directory will show up in your Control Machine container. This allows you to use a text editor, like [Atom](https://atom.io), to write your [Ansible](https://www.ansible.com) configuration on the host machine and run it in the Control Machine container without losing it once the containers are shutdown.

## Commands

### Startup the Environment
`docker-compose up --build -d`

### Connect to the Environment
`docker container exec -it udemy-mastering-ansible_control_1 bash`

### Shutdown The Environment
`docker-compose down --remove-orphan`

### Update to latest project version
`git pull`
**Note:** This should not change any of your files in the ansible/ directory within your clone of this project.

## Bugs, Corrections or Enhancements
If you find a bug, something that needs to be corrected, or a possible enhancement, please [create an issue](https://help.github.com/articles/creating-an-issue/) or better yet submit the fix through a [Pull Request](https://help.github.com/articles/about-pull-requests/).
