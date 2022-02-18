FROM centos:7

# first half also works with ubuntu:14.04
# I pieced varioud different docker files together so that they could reproduce the environment.

# https://github.com/tianon/docker-brew-ubuntu-core/blob/c5bc8f61f0e0a8aa3780a8dc3a09ae6558693117/trusty/Dockerfile

# install sudo
RUN yum update && yum -yq install sudo && \
    sudo yum -yq install git curl && \
    sudo yum -yq --fix-missing install make cmake gfortran-4.8 gcc-4.8 cloc  && \
    sudo yum -yq install --fix-missing libnetcdf-dev libnetcdff-dev && \
    sudo yum -yq install openmpi3-devel &&\
    sudo yum clean -q &&\
    sudo yum -yq install ncurses-dev

ENV LANG=C.UTF-8 LC_ALL=C.UTF-8

# docker build . -t sdat2/adcirc-swan-env

