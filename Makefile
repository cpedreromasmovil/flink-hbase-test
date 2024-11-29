.PHONY: down
down:
	docker-compose down -v --remove-orphans
.PHONY: up
up:
	docker-compose up -d
.PHONY: load-hbase-data
load-hbase-data:
	docker exec hbase sh -c "hbase shell /init-script.hbase"
