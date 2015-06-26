#!/bin/bash

echo Clean up docker containers...
docker ps -a | awk '!/^CONTAINER/ { print $1 }' | while read line; do
	docker rm -f $line
done
echo Done.
echo

echo Current containers running \(and not\)
echo ====================================
docker ps -a
echo

echo Cleaning up docker images...
docker images | awk '/^<none>/ { print $3 }' | while read line; do
	docker rmi $line
done
echo Done.
echo

echo Current available docker images
echo ===============================
docker images

echo
