FROM ghcr.io/wabarc/wayback

LABEL org.wabarc.homepage="http://github.com/wabarc" \
      org.wabarc.repository="http://github.com/wabarc/on-github" \
      com.github.actions.name="on-github" \
      com.github.actions.description="Host wayback service on GitHub using Actions." \
      com.github.actions.icon="package" \
      com.github.actions.color="red"

ENV BASE_DIR /wayback

WORKDIR ${BASE_DIR}

# Ref: https://wiki.alpinelinux.org/wiki/Fonts
RUN set -o pipefail && \
    apk add --no-cache \
    dbus \
    dumb-init \
    libstdc++ \
    nss \
    chromium \
    harfbuzz \
    freetype \
    ttf-freefont \
    ttf-font-awesome \
    font-noto \
    font-noto-arabic \
    font-noto-emoji \
    font-noto-cjk \
    font-noto-extra \
    font-noto-lao \
    font-noto-myanmar \
    font-noto-thai \
    font-noto-tibetan \
    supervisor \
    ca-certificates \
    py3-setuptools \
 && rm -rf /var/cache/apk/* /tmp/* /var/tmp/*

COPY entrypoint.sh /
COPY supervisord.conf /etc/

RUN chown wayback:nogroup /var/log/tor && \
    chown wayback:nogroup /var/lib/tor

USER wayback

ENTRYPOINT ["dumb-init", "--"]

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]
