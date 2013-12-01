#!/bin/bash
if (( $# < 2 )) ; then
  echo "usage: $0 target_dir count_to_skip"
  exit 1
fi
I=0
for F in jpgs/*.jpg ; do
  if (( $I == 0 )) ; then
    echo cp $F "$1/"
    cp "$F" "$1/"
  fi
  I=$((I+1))
  if (( $I == $2 )) ; then
    I=0
    continue
  fi
done
