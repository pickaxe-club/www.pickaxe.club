#!/bin/bash

set -e

cores=3

rm -rf map-old
start=$(date +%s)
mapcrafter -c mapcrafter.cfg  -j $cores
fin1=$(date +%s)
find map-gen -name '*.jpg' |xargs -P $cores jpegoptim --strip-all
fin2=$(date +%s)
chmod -R o+rX map-gen
mv map map-old
mv map-gen map

echo "map gen: $((($fin1-$start)/60)) min"
echo "total gen: $((($fin2-$start)/60)) min"
exit
