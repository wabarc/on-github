FROM ghcr.io/wabarc/wayback

LABEL repository="http://github.com/wabarc/on-github"
LABEL homepage="http://github.com/wabarc"
LABEL maintainer="Wayback Archiver <wabarc@tuta.io>"

LABEL com.github.actions.name="on-github."
LABEL com.github.actions.description="Host wayback service on GitHub using Actions."
LABEL com.github.actions.icon="package"
LABEL com.github.actions.color="red"

ENV BASE_DIR /wayback

# Install Chromium
RUN set -x \
    && echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" > /etc/apk/repositories \
    && echo "http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories \
    && echo "http://dl-cdn.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories \
    \
    && apk update \
    && apk add --no-cache dbus dumb-init libstdc++ nss chromium harfbuzz nss freetype ttf-freefont font-noto-emoji wqy-zenhei \
    && rm -rf /var/cache/apk/* /tmp/*

COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh

WORKDIR ${BASE_DIR}

ENTRYPOINT ["/entrypoint.sh"]
