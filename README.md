# Local environment with HBase, Zookeeper and Flink for testing

This is a Docker Compose setup to run HBase, Zookeeper and Flink in a single node cluster for testing purposes.

## Prerequisites

- Docker
- Docker Compose v2

## Quick Start

### Option 1: Automated Setup
Run the test script to build and start everything automatically:
```bash
./test-environment.sh
```

### Option 2: Manual Setup

1. **Build all containers:**
   ```bash
   make build
   ```

2. **Start all services:**
   ```bash
   make up
   ```

3. **Load test data into HBase:**
   ```bash
   make load-hbase-data
   ```

4. **Stop all services:**
   ```bash
   make down
   ```

## Accessing Flink SQL Client

After starting all containers, you can access the Flink SQL client with:

```bash
make sql-client
```

Or manually:
```bash
docker exec -it jobmanager bash
./opt/flink/bin/sql-client.sh embedded
```

## Example SQL Query

Once in the Flink SQL client, you can run a test query:

```sql
CREATE TABLE blacklist (
 rowkey INT,
 imeis ROW<key STRING, blacklisted BOOLEAN>,
 PRIMARY KEY (rowkey) NOT ENFORCED
) WITH (
 'connector' = 'hbase-2.2',
 'table-name' = 'blacklist',
 'zookeeper.quorum' = 'zookeeper:2181'
);

SELECT * FROM blacklist;
```

## Available Commands

Run `make help` to see all available commands:

- `make build` - Build all Docker containers
- `make up` - Start all services
- `make down` - Stop all services and remove volumes
- `make load-hbase-data` - Load test data into HBase
- `make logs` - Show logs from all services
- `make status` - Show status of all services
- `make sql-client` - Connect to Flink SQL client

## Services

- **Flink Web UI**: http://localhost:8081
- **HBase Master UI**: http://localhost:16010
- **Zookeeper**: localhost:2181