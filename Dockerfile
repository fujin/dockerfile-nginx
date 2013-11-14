FROM ubuntu
MAINTAINER AJ Christensen <aj@junglist.io>

ADD http://nginx.org/keys/nginx_signing.key /tmp/nginx_signing.key
ADD nginx.list /etc/apt/sources.list.d/nginx.list

RUN apt-key add /tmp/nginx_signing.key
RUN apt-get update
RUN apt-get install nginx
RUN rm /etc/nginx/conf.d/*
ADD nginx.conf /etc/nginx/nginx.conf
ADD default.conf /etc/nginx/conf.d/default.conf

EXPOSE 80 443
ENTRYPOINT ["/usr/sbin/nginx"]