### Local environment with hbase, zookeeper and flink for testing

This is a docker compose file to run hbase, zookeeper and flink in a single node cluster for testing purposes.

It is executed with hbase 1.2.0 with flink hbase connector 2.2

It is recommended to start colima VM with high requirements otherwise flink crashes for instance.
```beam.assembly
colima start -m 8 --disk 50
```

For running the compose file, you need to have docker and docker-compose installed in your machine.
Start all containers with the following command:
```beam.assembly
make build && make up
```
For load data in hbase after start all containers, you can run the following command:
```beam.assembly
make load-hbase-data
```
```beam.assembly
make down
```

After star all containers and load data in hbase, you can access to flink sql sheel with the following command:
```beam.assembly
docker exec -it jobmanager bash
/opt/flink/bin/sql-client.sh embedded
```
And run a test query:
```beam.assembly
CREATE TABLE blacklist (
 rowkey INT,
 imeis ROW<key STRING, blacklisted BOOLEAN>,
 PRIMARY KEY (rowkey) NOT ENFORCED
) WITH (
 'connector' = 'hbase-2.2',
 'table-name' = 'blacklist',
 'zookeeper.quorum' = 'zookeeper:2181'
);

select rowkey from blacklist;
```