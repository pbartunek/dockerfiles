#!/bin/bash

function build() {
  local image=$1
  local dir=$2

  docker build --rm --force-rm -t $image $dir;
}

if [ -z "$1" ]; then
  echo "Building all images"
  for dir in ./*/
  do
    image=$(basename $dir);
    echo "Building image: ${image}";
    build $image $dir
  done
else
  for image in "$@"
  do
    if [[ -d "./${image}" ]]; then
      echo "Building ${image}"
      build $image "./${image}/"
    else
      echo "Could not find Dockerfile for image: ${image}, skipping.";
    fi
  done
fi
