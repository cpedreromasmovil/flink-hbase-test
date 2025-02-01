FROM openjdk:8-jdk-alpine

# Define variables de entorno para HBase
ENV HBASE_VERSION=1.2.0
ENV HBASE_HOME=/opt/hbase
ENV JAVA_HOME=/usr
# Descarga HBase desde el repositorio oficial de Cloudera
RUN apk add --no-cache curl bash && \
    curl -o /tmp/hbase.tar.gz \
    https://archive.apache.org/dist/hbase/1.2.0/hbase-1.2.0-bin.tar.gz && \
    tar -xzf /tmp/hbase.tar.gz -C /opt && \
    mv /opt/hbase-1.2.0 /opt/hbase && \
    rm /tmp/hbase.tar.gz

# Añade HBase al PATH
ENV PATH="$HBASE_HOME/bin:$PATH"

# Expone puertos típicos de HBase
EXPOSE 16000 16010 16030
WORKDIR /
#ADD entrypoint.sh /
#RUN chmod +x entrypoint.sh
#ENTRYPOINT ["/entrypoint.sh"]
# Configuración por defecto: iniciar el master
# CMD ["hbase", "master", "start"]
