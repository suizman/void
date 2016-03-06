FROM ubuntu:wily

ENV CONSUL_V=0.6.3

### Copy some files

# Mesosphere repo
COPY files/mesosphere.list /etc/apt/sources.list.d/mesosphere.list

### Download Packages

# Update cache & gpg
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv E56151BF
RUN apt-get update -y

# Download Consul package
ADD https://releases.hashicorp.com/consul/${CONSUL_V}/consul_${CONSUL_V}_linux_amd64.zip /tmp

### Install packages
RUN apt-get install --no-install-recommends --no-install-suggests -y unzip mesos marathon
RUN apt-get install --no-install-recommends --no-install-suggests -y zookeeper

# Install consul
RUN unzip /tmp/consul_${CONSUL_V}_linux_amd64.zip -d /bin

### Clean stuff
RUN rm -rf /tmp/* /var/cache/apt/* /var/tmp/*

