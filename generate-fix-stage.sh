#!/bin/sh

OUTPUT="fix-stage.sh"
DIRS=$(cd boost_1_58_0/bin.v2/libs && ls)

echo "(cd boost_1_58_0 && grep FCCpx ../build-stage.log | grep '\-shared' | \\" > $OUTPUT
for d in $DIRS; do
  echo "sed 's#bin.v2/libs/$d/build/fccx/release/threading-multi/libboost#libboost#' | \\" >> $OUTPUT
done
echo "sed 's#bin.v2/libs/log/build/fccx/release/build-no/log-api-unix/threading-multi/libboost#libboost#' | \\" >> $OUTPUT
echo "sh)" >> $OUTPUT

sh $OUTPUT
mv boost_1_58_0/libboost_* boost_1_58_0/stage/lib/
