FROM ubuntu:14.04
MAINTAINER Mikhail Bortnyk

RUN apt-get -y update && apt-get -y install sudo openssh-server git curl rake ruby2.0 ruby2.0-dev \
  bison libcurl4-openssl-dev libhiredis-dev libmarkdown2-dev libcap-dev libcgroup-dev make libpcre3 \
  libpcre3-dev libmysqlclient-dev automake autoconf libtool

RUN cd /usr/local/src && wget http://nginx.org/download/nginx-1.9.5.tar.gz
RUN cd /usr/local/src && tar xf nginx-1.9.5.tar.gz
RUN cd /usr/local/src/nginx-1.9.5 && ./configure --with-http_stub_status_module --with-http_ssl_module --prefix=/usr/local/nginx \
  --with-http_realip_module --with-http_addition_module --with-http_sub_module --with-http_gunzip_module \
  --with-http_gzip_static_module --with-http_random_index_module --with-http_secure_link_module
RUN cd /usr/local/src/nginx-1.9.5 && make && make install

ADD app/ app
WORKDIR app
RUN gem2.0 install bundler
RUN bundle install

ADD conf /usr/local/nginx/conf
ADD conf/nginx.conf /usr/local/nginx/conf/nginx.conf

ADD run.sh /root/run.sh
RUN chmod +x /root/run.sh
RUN rm -f /tmp/unicorn.pid

EXPOSE 80
EXPOSE 443

CMD ["/root/run.sh"]
