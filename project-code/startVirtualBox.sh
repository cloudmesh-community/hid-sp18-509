#!/bin/bash
docker-machine create --virtualbox-cpu-count "-1" --virtualbox-memory 1024 -d virtualbox vm
docker-machine start vm

docker-machine ssh vm





