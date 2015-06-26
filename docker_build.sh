#!/bin/bash

if [ "$1" == "--rm" ]; then
	docker rmi -f devbase
fi

docker build -t devbase .

