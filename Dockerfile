FROM alpine

ENV APK_ARGS='--no-progress --purge'

RUN echo "http://dl-4.alpinelinux.org/alpine/edge/community/" >>/etc/apk/repositories && \
    apk $APK_ARGS update && \
    apk $APK_ARGS upgrade && \
    apk $APK_ARGS add dnscrypt-proxy bash iptables
    #rm -rf /tmp/* /var/tmp/* /var/cache/apk/* /var/cache/distfiles/*

EXPOSE 2053
EXPOSE 2053/udp

CMD ["/usr/sbin/dnscrypt-proxy", "--local-address=0.0.0.0:2053", "--resolvers-list=/usr/share/dnscrypt-proxy/dnscrypt-resolvers.csv", "--resolver-name=soltysiak"]
