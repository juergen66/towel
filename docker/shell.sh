#!/bin/sh

BUILDHOME=$(dirname `pwd`)

docker run -ti --privileged --volume $BUILDHOME:/build/ towel-build-image bash
