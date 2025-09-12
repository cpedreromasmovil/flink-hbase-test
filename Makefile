.PHONY: down
down:
	DOCKER_DEFAULT_PLATFORM=linux/amd64 docker compose down -v --remove-orphans

.PHONY: build
build:
	DOCKER_DEFAULT_PLATFORM=linux/amd64 docker compose build

.PHONY: up
up:
	DOCKER_DEFAULT_PLATFORM=linux/amd64 docker compose up -d

.PHONY: load-hbase-data
load-hbase-data:
	DOCKER_DEFAULT_PLATFORM=linux/amd64 docker exec hbase sh -c "hbase shell /init-script.hbase"

.PHONY: logs
logs:
	DOCKER_DEFAULT_PLATFORM=linux/amd64 docker compose logs -f

.PHONY: status
status:
	DOCKER_DEFAULT_PLATFORM=linux/amd64 docker compose ps

.PHONY: sql-client
sql-client:
	@echo "Connecting to Flink SQL client..."
	@echo "Run: CREATE TABLE blacklist (rowkey INT, imeis ROW<key STRING, blacklisted BOOLEAN>, PRIMARY KEY (rowkey) NOT ENFORCED) WITH ('connector' = 'hbase-2.2', 'table-name' = 'blacklist', 'zookeeper.quorum' = 'zookeeper:2181');"
	@echo "Then: SELECT * FROM blacklist;"
	docker exec -it jobmanager /opt/flink/bin/sql-client.sh embedded

.PHONY: help
help:
	@echo "Available commands:"
	@echo "  build           - Build all Docker containers"
	@echo "  up              - Start all services"
	@echo "  down            - Stop all services and remove volumes"
	@echo "  load-hbase-data - Load test data into HBase"
	@echo "  logs            - Show logs from all services"
	@echo "  status          - Show status of all services"
	@echo "  sql-client      - Connect to Flink SQL client"
	@echo "  help            - Show this help message"
