FROM alpine:3.8

ARG VIEWER_GID=5901
ARG VIEWER_UID=${VIEWER_GID}

RUN set -x \
 && apk --no-cache add \
    dbus \
    virt-viewer \
 && addgroup -g ${VIEWER_GID} viewer \
 && adduser -D -G viewer -u ${VIEWER_UID} -S viewer \
 && remote-viewer --version

USER viewer

ENTRYPOINT ["remote-viewer"]
CMD ["--help"]
