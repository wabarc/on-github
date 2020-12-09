FROM ghcr.io/wabarc/wayback

LABEL version="0.0.1"
LABEL repository="http://github.com/wabarc/on-github"
LABEL homepage="http://github.com/wabarc"
LABEL maintainer="Wayback Archiver <wabarc@tuta.io>"

LABEL com.github.actions.name="on-github."
LABEL com.github.actions.description="Host wayback service on GitHub using Actions."
LABEL com.github.actions.icon="package"
LABEL com.github.actions.color="red"

COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
