#!/bin/sh

# Build Docker Image
docker build -t car-parking-app .

# Run the Container
docker run -p 8080:8080 car-parking-app
