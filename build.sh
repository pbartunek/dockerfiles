#!/bin/bash

for dir in ./*/
do
  image=$(basename $dir);
  echo "Building image: ${image}";
  docker build --rm --force-rm -t $image $dir;
done
