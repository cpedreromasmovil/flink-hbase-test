.PHONY: down
down:
	docker-compose down -v --remove-orphans
.PHONY: up
build:
	DOCKER_DEFAULT_PLATFORM=linux/amd64 docker-compose build
up:
	DOCKER_DEFAULT_PLATFORM=linux/amd64 docker-compose up
.PHONY: load-hbase-data
load-hbase-data:
	docker exec hbase sh -c "hbase shell /init-script.hbase"
.PHONY: init-region
init-region:
	docker exec hbase sh -c "hbase-daemon.sh start regionserver"
