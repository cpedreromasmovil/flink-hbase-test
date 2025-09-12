FROM flink:1.20

# Update ca-certificates and install required tools
RUN apt-get update && \
    apt-get install -y ca-certificates curl wget && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /opt/flink/lib

# Define dependency versions for better maintainability
ENV COMMONS_CONFIG_VERSION=2.1.1
ENV COMMONS_LOGGING_VERSION=1.1.3
ENV HADOOP_VERSION=3.3.4
ENV FLINK_SHADED_GUAVA_VERSION=30.1.1-jre-16.0
ENV HADOOP_SHADED_GUAVA_VERSION=1.3.0
ENV STAX2_API_VERSION=4.2.1
ENV WOODSTOX_VERSION=5.3.0
ENV FLINK_HBASE_CONNECTOR_VERSION=1.17.2

# Download dependencies using wget for better compatibility
# Note: For production, consider verifying checksums of downloaded artifacts
RUN wget --no-check-certificate --retry-connrefused --waitretry=1 --read-timeout=20 --timeout=15 -t 3 \
    "https://repo1.maven.org/maven2/org/apache/commons/commons-configuration2/${COMMONS_CONFIG_VERSION}/commons-configuration2-${COMMONS_CONFIG_VERSION}.jar" && \
    wget --no-check-certificate --retry-connrefused --waitretry=1 --read-timeout=20 --timeout=15 -t 3 \
    "https://repo1.maven.org/maven2/commons-logging/commons-logging/${COMMONS_LOGGING_VERSION}/commons-logging-${COMMONS_LOGGING_VERSION}.jar" && \
    wget --no-check-certificate --retry-connrefused --waitretry=1 --read-timeout=20 --timeout=15 -t 3 \
    "https://repo1.maven.org/maven2/org/apache/hadoop/hadoop-auth/${HADOOP_VERSION}/hadoop-auth-${HADOOP_VERSION}.jar" && \
    wget --no-check-certificate --retry-connrefused --waitretry=1 --read-timeout=20 --timeout=15 -t 3 \
    "https://repo1.maven.org/maven2/org/apache/hadoop/hadoop-common/${HADOOP_VERSION}/hadoop-common-${HADOOP_VERSION}.jar" && \
    wget --no-check-certificate --retry-connrefused --waitretry=1 --read-timeout=20 --timeout=15 -t 3 \
    "https://repo1.maven.org/maven2/org/apache/hadoop/hadoop-hdfs/${HADOOP_VERSION}/hadoop-hdfs-${HADOOP_VERSION}.jar" && \
    wget --no-check-certificate --retry-connrefused --waitretry=1 --read-timeout=20 --timeout=15 -t 3 \
    "https://repo1.maven.org/maven2/org/apache/flink/flink-shaded-guava/${FLINK_SHADED_GUAVA_VERSION}/flink-shaded-guava-${FLINK_SHADED_GUAVA_VERSION}.jar" && \
    wget --no-check-certificate --retry-connrefused --waitretry=1 --read-timeout=20 --timeout=15 -t 3 \
    "https://repo1.maven.org/maven2/org/apache/hadoop/thirdparty/hadoop-shaded-guava/${HADOOP_SHADED_GUAVA_VERSION}/hadoop-shaded-guava-${HADOOP_SHADED_GUAVA_VERSION}.jar" && \
    wget --no-check-certificate --retry-connrefused --waitretry=1 --read-timeout=20 --timeout=15 -t 3 \
    "https://repo1.maven.org/maven2/org/codehaus/woodstox/stax2-api/${STAX2_API_VERSION}/stax2-api-${STAX2_API_VERSION}.jar" && \
    wget --no-check-certificate --retry-connrefused --waitretry=1 --read-timeout=20 --timeout=15 -t 3 \
    "https://repo1.maven.org/maven2/com/fasterxml/woodstox/woodstox-core/${WOODSTOX_VERSION}/woodstox-core-${WOODSTOX_VERSION}.jar" && \
    wget --no-check-certificate --retry-connrefused --waitretry=1 --read-timeout=20 --timeout=15 -t 3 \
    "https://repo1.maven.org/maven2/org/apache/hadoop/hadoop-hdfs-client/${HADOOP_VERSION}/hadoop-hdfs-client-${HADOOP_VERSION}.jar" && \
    wget --no-check-certificate --retry-connrefused --waitretry=1 --read-timeout=20 --timeout=15 -t 3 \
    "https://repo1.maven.org/maven2/org/apache/hadoop/hadoop-mapreduce-client-core/${HADOOP_VERSION}/hadoop-mapreduce-client-core-${HADOOP_VERSION}.jar"

# Download Flink HBase connector
RUN wget --no-check-certificate --retry-connrefused --waitretry=1 --read-timeout=20 --timeout=15 -t 3 \
    "https://repo.maven.apache.org/maven2/org/apache/flink/flink-sql-connector-hbase-2.2/${FLINK_HBASE_CONNECTOR_VERSION}/flink-sql-connector-hbase-2.2-${FLINK_HBASE_CONNECTOR_VERSION}.jar"

# Verify that all expected JARs are present
RUN ls -la /opt/flink/lib/*.jar

