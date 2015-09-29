FROM ubuntu:14.04
MAINTAINER Mikhail Bortnyk

RUN apt-get -y update && apt-get -y install sudo openssh-server git curl rake ruby2.0 ruby2.0-dev \
  bison libcurl4-openssl-dev libhiredis-dev libmarkdown2-dev libcap-dev libcgroup-dev make libpcre3 \
  libpcre3-dev libmysqlclient-dev automake autoconf libtool

# build mongo-c-driver
RUN cd /usr/local/src/ && git clone https://github.com/mongodb/mongo-c-driver.git
RUN cd /usr/local/src/mongo-c-driver && ./autogen.sh && make && make install

# build ngx_mruby
RUN cd /usr/local/src/ && git clone https://github.com/matsumoto-r/ngx_mruby.git
ENV NGINX_CONFIG_OPT_ENV --with-http_stub_status_module --with-http_ssl_module --prefix=/usr/local/nginx \
  --with-http_realip_module --with-http_addition_module --with-http_sub_module --with-http_gunzip_module \
  --with-http_gzip_static_module --with-http_random_index_module --with-http_secure_link_module
ADD build/build_config.rb /usr/local/src/ngx_mruby/build_config.rb
RUN cd /usr/local/src/ngx_mruby && sh build.sh && make install

# run ldconfig
RUN ldconfig

# upload configuration
ADD hook /usr/local/nginx/hook
ADD conf /usr/local/nginx/conf
ADD conf/nginx.conf /usr/local/nginx/conf/nginx.conf

EXPOSE 80
EXPOSE 443

ADD run.sh /root/run.sh
RUN chmod +x /root/run.sh

CMD ["/root/run.sh"]
