#!/bin/sh

BUILDHOME=$(dirname `pwd`)

docker run --privileged --volume $BUILDHOME:/build/ towel-build-image make -C /build/
