FROM ubuntu:trusty
LABEL maintainer "Cheewai Lai <clai@csir.co.za>"

ARG GOSU_VERSION=1.10
ARG DEBIAN_FRONTEND=noninteractive
ARG DOCKERIZE_VERSION=v0.5.0
USER root

#
# Hardcoded to MySQL client 5.5 because newer releases are not compatible with pre-5.5 servers
#
RUN apt-get update \
 && apt-get -y install curl build-essential \
 && apt-get -y install python-setuptools python-pip python-mysqldb mysql-client-5.5 python-shapely python-bson \
 && curl -o /usr/local/bin/gosu -ksSL "https://github.com/tianon/gosu/releases/download/${GOSU_VERSION}/gosu-amd64" \
 && chmod +x /usr/local/bin/gosu \
 && pip install --upgrade pip \
 && ls -l /usr/local/bin/pip \
 && env \
 && /usr/local/bin/pip install --upgrade dateutils bottle raven \
 && curl -k -fsSL https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz | tar xfz - -C /usr/bin \
 && apt-get -y remove --purge build-essential \
 && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ADD docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod 755 /docker-entrypoint.sh \
 && chown root.root /docker-entrypoint.sh
