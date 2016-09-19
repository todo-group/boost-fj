#!/bin/sh

PREFIX=$HOME/boost
BOOST_VERSION=1_58_0

SRC_DIR=$(dirname $0)

(cd $SRC_DIR/boost_$BOOST_VERSION/tools/build && \
 sh bootstrap.sh && \
 ./b2 --prefix=$PREFIX toolset=gcc install)
