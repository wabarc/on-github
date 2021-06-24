FROM ghcr.io/wabarc/wayback:edge

LABEL org.wabarc.homepage="http://github.com/wabarc" \
      org.wabarc.repository="http://github.com/wabarc/on-github" \
      com.github.actions.name="on-github" \
      com.github.actions.description="Host wayback service on GitHub using Actions." \
      com.github.actions.icon="package" \
      com.github.actions.color="red"

ENV WD=/wayback
ENV WAYBACK_BOLT_PATH="${WD}/wayback.db"
ENV WAYBACK_STORAGE_DIR="/tmp/reduxer"
ENV CHROMEDP_NO_SANDBOX=true
ENV CHROMEDP_DISABLE_GPU=true
ENV GC_MEM=2048

WORKDIR ${BASE_DIR}

# Ref: https://wiki.alpinelinux.org/wiki/Fonts
RUN echo @v3.15 https://dl-cdn.alpinelinux.org/alpine/v3.15/community >> /etc/apk/repositories && \
    echo @v3.15 https://dl-cdn.alpinelinux.org/alpine/v3.15/main >> /etc/apk/repositories && \
    set -o pipefail && \
    apk add --no-cache \
    dbus \
    dumb-init \
    libstdc++ \
    libwebp-tools \
    nss@v3.15 \
    ffmpeg@v3.15 \
    chromium@v3.15 \
    harfbuzz@v3.15 \
    freetype@v3.15 \
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
    you-get \
    rtmpdump \
    youtube-dl \
    supervisor \
    ca-certificates \
    py3-setuptools \
 && rm -rf /var/cache/apk/* /tmp/* /var/tmp/*

COPY cleaner.sh /
COPY entrypoint.sh /
COPY supervisord.conf /etc/

RUN set -ex; \
    chown wayback:nogroup /var/log/tor; \
    chown wayback:nogroup /var/lib/tor; \
    chmod a+r /etc/supervisord.conf /entrypoint.sh /cleaner.sh; \
    \
    sed -i 's/User/#User/g' /etc/tor/torrc

USER wayback

ENTRYPOINT ["dumb-init", "--"]

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]
