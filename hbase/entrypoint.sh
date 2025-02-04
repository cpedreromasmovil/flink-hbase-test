#!/usr/bin/env bash

set -euox pipefail

export HBASE_HOME="/opt/hbase"
export JAVA_HOME="${JAVA_HOME:-/usr}"

echo "================================================================================"
echo "                              HBase Docker Container"
echo "================================================================================"
echo
mkdir -pv "$HBASE_HOME/logs"

start_master(){
  echo "Starting HBase Master..."
  hbase start master
  echo
}

start_regionserver(){
  echo "Starting HBase RegionServer..."
  "${HBASE_HOME}/bin/hbase-daemon.sh" start regionserver
  echo
}

  start_master
  sleep 10
  start_regionserver

wait ::