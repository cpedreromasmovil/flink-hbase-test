#!/bin/bash

# Test script for Flink-HBase environment
# This script builds, starts, and tests the Flink-HBase environment

set -e

echo "🚀 Starting Flink-HBase test environment setup..."

# Build containers
echo "📦 Building Docker containers..."
make build

# Start services
echo "🔄 Starting services..."
make up

# Wait for services to be ready
echo "⏳ Waiting for services to start..."
sleep 30

# Check if services are running
echo "🔍 Checking service status..."
make status

# Load test data
echo "📄 Loading test data into HBase..."
sleep 10  # Wait a bit more for HBase to be fully ready
make load-hbase-data

echo "✅ Environment setup complete!"
echo ""
echo "🎯 You can now:"
echo "   - Access Flink Web UI at: http://localhost:8081"
echo "   - Access HBase Master UI at: http://localhost:16010"
echo "   - Connect to Flink SQL client with: make sql-client"
echo ""
echo "📊 Test query to run in Flink SQL client:"
echo "CREATE TABLE blacklist ("
echo " rowkey INT,"
echo " imeis ROW<key STRING, blacklisted BOOLEAN>,"
echo " PRIMARY KEY (rowkey) NOT ENFORCED"
echo ") WITH ("
echo " 'connector' = 'hbase-2.2',"
echo " 'table-name' = 'blacklist',"
echo " 'zookeeper.quorum' = 'zookeeper:2181'"
echo ");"
echo ""
echo "SELECT * FROM blacklist;"