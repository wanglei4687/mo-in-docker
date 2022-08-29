.PHONY: build
build:
	@docker build -f Dockerfile . -t matrixorigin/matrixone-operator:playground

.PHONY: run
run: build
	@docker run --privileged  -it matrixorigin/matrixone-operator:playground /bin/sh