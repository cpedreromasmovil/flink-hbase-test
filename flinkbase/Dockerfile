FROM flink:1.20
RUN apt-get update && apt-get install -y curl bash netcat iputils-ping

WORKDIR /opt/flink/lib

RUN curl https://repo1.maven.org/maven2/org/apache/commons/commons-configuration2/2.1.1/commons-configuration2-2.1.1.jar -O && \
    curl https://repo1.maven.org/maven2/commons-logging/commons-logging/1.1.3/commons-logging-1.1.3.jar -O && \
    curl https://repo1.maven.org/maven2/org/apache/hadoop/hadoop-auth/3.3.4/hadoop-auth-3.3.4.jar -O && \
    curl https://repo1.maven.org/maven2/org/apache/hadoop/hadoop-common/3.3.4/hadoop-common-3.3.4.jar -O && \
    curl https://repo1.maven.org/maven2/org/apache/hadoop/hadoop-hdfs/3.3.4/hadoop-hdfs-3.3.4.jar -O && \
	curl https://repo1.maven.org/maven2/org/apache/flink/flink-shaded-guava/30.1.1-jre-16.0/flink-shaded-guava-30.1.1-jre-16.0.jar -O && \
    curl https://repo1.maven.org/maven2/org/apache/hadoop/thirdparty/hadoop-shaded-guava/1.3.0/hadoop-shaded-guava-1.3.0.jar -O && \
    curl https://repo1.maven.org/maven2/org/codehaus/woodstox/stax2-api/4.2.1/stax2-api-4.2.1.jar -O && \
    curl https://repo1.maven.org/maven2/com/fasterxml/woodstox/woodstox-core/5.3.0/woodstox-core-5.3.0.jar -O && \
    curl https://repo1.maven.org/maven2/org/apache/hadoop/hadoop-hdfs-client/3.3.4/hadoop-hdfs-client-3.3.4.jar -O && \
    curl https://repo1.maven.org/maven2/org/apache/hadoop/hadoop-mapreduce-client-core/3.3.4/hadoop-mapreduce-client-core-3.3.4.jar -O

RUN curl -o /opt/flink/lib/flink-sql-connector-hbase-2.2-1.17.2.jar \
    https://repo.maven.apache.org/maven2/org/apache/flink/flink-sql-connector-hbase-2.2/1.17.2/flink-sql-connector-hbase-2.2-1.17.2.jar

# RUN curl -o /opt/flink/lib/flink-connector-hbase-1.4_2.12-1.12.0.jar \
#      https://repo.maven.apache.org/maven2/org/apache/flink/flink-connector-hbase-1.4_2.12/1.12.0/flink-connector-hbase-1.4_2.12-1.12.0.jar

