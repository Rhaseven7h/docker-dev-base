#!/bin/bash

docker run --hostname=devbase_dev --name=devbase_dev -p 3000:3000 -ti -v `pwd`:/opt/devbase devbase /bin/bash

