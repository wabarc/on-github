IMAGE := wabarc/on-github
DOCKER ?= $(shell which docker || which podman)

.PHONY: build
build:
	@$(DOCKER) build -t $(IMAGE) .

.PHONY: run
run:
	@$(DOCKER) run -ti --rm --init -e WAYBACK_DAEMON=web -e WAYBACK_TO=ia,is,ph,ip -e DEBUG=1 $(IMAGE)
