# Flink-HBase Test Environment

A Docker-based testing environment for Apache Flink with HBase integration, including Zookeeper coordination. This setup provides a complete single-node cluster for development and testing purposes.

## Prerequisites

- Docker (version 20.10 or later)
- Docker Compose (version 2.0 or later)
- Make (for convenience commands)

## Quick Start

### 1. Build and Start Services

```bash
# Build the Docker images
make build

# Start all containers (HBase, Zookeeper, Flink)
make up
```

### 2. Load Sample Data

After all containers are running, populate HBase with test data:

```bash
make load-hbase-data
```

### 3. Access Flink SQL Client

Connect to the Flink JobManager and start the SQL client:

```bash
docker exec -it jobmanager bash
/opt/flink/bin/sql-client.sh embedded
```

### 4. Test the Setup

Run this sample query in the Flink SQL client to verify the integration:

```sql
-- Create a Flink table connected to HBase
CREATE TABLE blacklist (
  rowkey INT,
  imeis ROW<key STRING, blacklisted BOOLEAN>,
  PRIMARY KEY (rowkey) NOT ENFORCED
) WITH (
  'connector' = 'hbase-2.2',
  'table-name' = 'blacklist',
  'zookeeper.quorum' = 'zookeeper:2181'
);

-- Query the data
SELECT rowkey FROM blacklist;
```

## Available Commands

| Command | Description |
|---------|-------------|
| `make build` | Build Docker images |
| `make up` | Start all services |
| `make down` | Stop and remove all containers |
| `make load-hbase-data` | Populate HBase with test data |
| `make logs` | View logs from all services |
| `make status` | Check status of all containers |
| `make clean` | Stop containers and clean up Docker resources |

## Service Access

- **Flink Web UI**: http://localhost:8081
- **HBase Master UI**: http://localhost:16010
- **Zookeeper**: localhost:2181

## Architecture

The environment consists of:

- **Zookeeper**: Coordination service for HBase
- **HBase**: NoSQL database with sample blacklist/whitelist tables
- **Flink JobManager**: Flink cluster coordinator
- **Flink TaskManager**: Flink task execution node

## Sample Data Structure

### Blacklist Table
- **Table**: `blacklist`
- **Column Family**: `imeis`
- **Sample Data**: IMEI blacklisting information

### Whitelist Table  
- **Table**: `whitelist`
- **Column Family**: `imsis`
- **Sample Data**: IMSI whitelisting information

## Troubleshooting

### Common Issues

1. **Port conflicts**: Ensure ports 2181, 8081, 16010, 16000, 16201, 16301 are available
2. **Docker resources**: Make sure Docker has sufficient memory (recommend 4GB+)
3. **Build failures**: Run `make clean` and retry `make build`

### Logs and Debugging

```bash
# View logs from all services
make logs

# View logs from specific service
docker compose logs -f <service_name>

# Check container status
make status
```

## Cleanup

To stop all services and clean up:

```bash
make down
```

To also remove Docker build cache and unused resources:

```bash
make clean
```