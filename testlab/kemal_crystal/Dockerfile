FROM ubuntu:14.04
MAINTAINER Aleksey Dashkevych

RUN apt-get -y update && apt-get -y install sudo curl

RUN curl http://dist.crystal-lang.org/apt/setup.sh | sudo bash

RUN apt-get -y update && apt-get -y install openssh-server git crystal \
  bison libcurl4-openssl-dev libhiredis-dev libmarkdown2-dev libcap-dev libcgroup-dev make libpcre3 \
  libpcre3-dev libmysqlclient-dev automake autoconf libtool libyaml-dev

# build mongo-c-driver
RUN cd /usr/local/src/ && git clone https://github.com/mongodb/mongo-c-driver.git
RUN cd /usr/local/src/mongo-c-driver && ./autogen.sh && make && make install
RUN ldconfig

RUN mkdir /app
WORKDIR /app
COPY . /app

RUN shards install
RUN crystal build --release src/kemal_crystal.cr

COPY run.sh /root/run.sh
RUN chmod +x /root/run.sh

CMD ["/root/run.sh"]
