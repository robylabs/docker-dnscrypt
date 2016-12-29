FROM alpine

ENV APK_ARGS='--no-progress --purge'

ADD sbin/start_dnscrypt /usr/local/sbin/start_dnscrypt

RUN echo "http://dl-4.alpinelinux.org/alpine/edge/community/" >>/etc/apk/repositories && \
    apk $APK_ARGS update && \
    apk $APK_ARGS upgrade && \
    apk $APK_ARGS add dnscrypt-proxy bash && \
    rm -rf /tmp/* /var/tmp/* /var/cache/apk/* /var/cache/distfiles/*

EXPOSE 2053
EXPOSE 2053/udp

CMD ["/usr/local/sbin/start_dnscrypt"]
