### Local environment with hbase, zookeeper and flink for testing

This is a docker compose file to run hbase, zookeeper and flink in a single node cluster for testing purposes.
For running the compose file, you need to have docker and docker-compose installed in your machine.
Start all containers with the following command:
```beam.assembly
make up
```
For load data in hbase after start all containers, you can run the following command:
```beam.assembly
make load-hbase-data
```
```beam.assembly
make down
```

After star all containers, you can access to the following services:

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

select * from blacklist;
```