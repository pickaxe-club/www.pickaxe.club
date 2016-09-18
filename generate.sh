#!/bin/bash

set -e

cores=3

rm -rf map-old
time mapcrafter -c mapcrafter.cfg -j $cores
find map-gen -name '*.jpg' |xargs -P $cores jpegoptim --strip-all
chmod -R o+rX map-gen
mv map map-old
mv map-gen map

exit
