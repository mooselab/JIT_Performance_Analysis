#!/bin/bash

# Build Docker image
docker build --platform linux/amd64 -t process_file .

# Run Docker container
container_id=$(docker run -dit process_file)

# Wait for the process to finish (JMH Benchmarking)
echo "Waiting for the process to finish..."
docker wait $container_id

# Copy files from Docker container to host
docker cp $container_id:/app/java_slices_directory.txt /Users/benjaminboucher/Desktop/Research/Docker/java_slices_directory.txt
docker cp $container_id:/app/benchmark/jmh-result.json /Users/benjaminboucher/Desktop/Research/Docker/jmh-result.json

# Stop and remove the Docker container
docker stop $container_id