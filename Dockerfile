FROM ghcr.io/wabarc/wayback

LABEL org.wabarc.homepage="http://github.com/wabarc" \
      org.wabarc.repository="http://github.com/wabarc/on-github" \
      com.github.actions.name="on-github" \
      com.github.actions.description="Host wayback service on GitHub using Actions." \
      com.github.actions.icon="package" \
      com.github.actions.color="red"

ENV WD=/wayback
ENV WAYBACK_BOLT_PATH="${WD}/wayback.db"
ENV CHROMEDP_NO_SANDBOX=true
ENV CHROMEDP_DISABLE_GPU=true
ENV GC_MEM=2048

WORKDIR ${BASE_DIR}

# Ref: https://wiki.alpinelinux.org/wiki/Fonts
RUN echo @edge https://dl-cdn.alpinelinux.org/alpine/edge/community >> /etc/apk/repositories && \
    echo @edge https://dl-cdn.alpinelinux.org/alpine/edge/main >> /etc/apk/repositories && \
    set -o pipefail && \
    apk add --no-cache \
    dbus \
    dumb-init \
    libstdc++ \
    nss@edge \
    ffmpeg \
    chromium@edge \
    harfbuzz@edge \
    libwebp-tools \
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
