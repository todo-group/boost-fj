#!/bin/sh

PREFIX=$HOME/boost
BOOST_VERSION=1_58_0

SRC_DIR=$(dirname $0)

(cd $SRC_DIR/boost_$BOOST_VERSION && \
 echo "using mpi : $(which mpiFCCpx) ;" > user-config.jam && \
 env BOOST_BUILD_PATH=. $PREFIX/bin/b2 -d2 --prefix=$PREFIX --layout=tagged --without-context --without-coroutine --without-python toolset=fccx stage) | tee build-stage.log
