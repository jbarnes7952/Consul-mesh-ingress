ARG CONSUL_VERSION=1.8.4-ent
FROM hashicorp/consul-enterprise:$CONSUL_VERSION

RUN wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub
RUN wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.32-r0/glibc-2.32-r0.apk
RUN apk add glibc-2.32-r0.apk

RUN curl -L https://getenvoy.io/cli | sh -s -- -b /usr/local/bin 
RUN getenvoy run standard:1.14.4 -- --version
RUN cp /root/.getenvoy/builds/standard/1.14.4/linux_glibc/bin/envoy /usr/bin
