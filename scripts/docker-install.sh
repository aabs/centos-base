#!/bin/bash -eux

# remove any pre-installed versions docker
yum remove docker \
                  docker-common \
                  docker-selinux \
                  docker-engine

# install pre-reqs
yum install -y yum-utils device-mapper-persistent-data lvm2

yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo

# disable unstable package reposß explicitly
yum-config-manager --disable docker-ce-edge
yum-config-manager --disable docker-ce-test

# Update the yum package index.
yum makecache fast

# Install the latest version of Docker CE, or go to the next step to install a specific version.
yum install -y docker-ce

# Start Docker.
systemctl start docker

# Verify that docker is installed correctly by getting the docker info
docker info
