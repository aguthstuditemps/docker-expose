#!/bin/sh
DHOST=$1
CONTAINER=$2
ssh $DHOST << EOF
  docker rm -f port-bridge;
  docker run --rm --name port-bridge --link $CONTAINER -p :22 jdeathe/centos-ssh:latest
EOF
