FROM openjdk:8-jdk-slim

RUN apt-get update && apt-get install -y curl bash netcat

ENV HBASE_HOME=/opt/hbase
ENV JAVA_HOME=/usr
ENV PATH ${HBASE_HOME}/bin:${PATH}
ENV HBASE_VERSION=1.2.0
ENV JAVA_HOME=/usr/local/openjdk-8
ENV PATH=$JAVA_HOME/bin:$PATH
RUN curl -L https://archive.apache.org/dist/hbase/${HBASE_VERSION}/hbase-${HBASE_VERSION}-bin.tar.gz | tar -xz -C /opt \
    && mv /opt/hbase-${HBASE_VERSION} $HBASE_HOME

WORKDIR ${HBASE_HOME}
ENTRYPOINT ["/bin/bash", "-c", "/opt/hbase/bin/start-hbase.sh && tail -f /dev/null"]
