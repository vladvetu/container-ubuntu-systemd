ARG BASE_TAG=20.04

FROM docker.io/ubuntu:${BASE_TAG}

LABEL maintainer="Vlad Vetu"

ARG DEBIAN_FRONTEND=noninteractive

# Enable systemd on container
ENV container=docker

RUN  apt-get -y update && \
      apt-get --no-install-recommends -y install \
      apt-utils software-properties-common \
      rsyslog systemd systemd-cron iproute2  && \
      apt-get -y autoclean && \
      rm -Rf /var/lib/apt/lists/* && \
      rm -Rf /usr/share/doc && \
      rm -Rf /usr/share/man

VOLUME ["/sys/fs/cgroup", "/tmp", "/run"]

CMD ["/lib/systemd/systemd"]