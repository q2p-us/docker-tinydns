FROM alpine:3.5

RUN apk add --no-cache tinydns drill curl

ENV ROOT="/opt/tinydns/" IP="0.0.0.0" UID="0" GID="0"
EXPOSE 53/udp

WORKDIR /opt/tinydns

COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
COPY data.tmpl /opt/tinydns/data.tmpl

ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]

CMD ["tinydns"]
