FROM alpine:3.17
LABEL maintainer="docker-dnsmasq-dev@whi.tw"
# fetch dnsmasq and webproc binary
RUN apk add --no-cache \
		dnsmasq

#configure dnsmasq
RUN mkdir -p /etc/default/ \
	&& echo -e "ENABLED=1\nIGNORE_RESOLVCONF=yes" > /etc/default/dnsmasq
RUN mkdir -p /etc/dnsmasq.d/

COPY dnsmasq.conf /etc/dnsmasq.conf
VOLUME [ "/etc/dnsmasq.d" ]

EXPOSE 53/tcp 53/udp
#run!
ENTRYPOINT ["dnsmasq", "--no-daemon"]
