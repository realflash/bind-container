FROM debian:jessie

# Install samba
RUN export DEBIAN_FRONTEND='noninteractive' && \
    apt-get update -qq && \
    apt-get install -qqy --no-install-recommends bind9 \
                $(apt-get -s dist-upgrade|awk '/^Inst.*ecurity/ {print $2}') &&\
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/*
RUN touch /var/log/bind9.log

#COPY samba.sh /usr/bin/

#VOLUME ["/etc/samba"]

EXPOSE 53 53/udp

CMD /etc/init.d/bind9 start

