FROM ubuntu/bind9

RUN mkdir -p /etc/bind/zones

COPY named.conf.local /etc/bind/

COPY db.asa.br /etc/bind/zones