.PHONY: down
down:
	DOCKER_DEFAULT_PLATFORM=linux/amd64 docker-compose down -v --remove-orphans
.PHONY: build
build:
	DOCKER_DEFAULT_PLATFORM=linux/amd64 docker-compose build
.PHONY: up
up:
	DOCKER_DEFAULT_PLATFORM=linux/amd64 docker-compose up -d
.PHONY: load-hbase-data
load-hbase-data:
	DOCKER_DEFAULT_PLATFORM=linux/amd64 docker exec hbase sh -c "hbase shell /init-script.hbase"
