.PHONY: build
build:
	@docker build --no-cache -f Dockerfile . -t matrixorigin/matrixone-operator:playground

.PHONY: run
run: build
	@docker run --name mo-in-docker --privileged -d  matrixorigin/matrixone-operator:playground

.PHONY: terminal
terminal: build run
	@docker exec -it mo-in-docker /bin/sh

.PHONY: clean
clean:
	@docker stop mo-in-docker
	@docker rm mo-in-docker
