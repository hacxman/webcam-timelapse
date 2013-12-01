#!/bin/bash
if (( $# < 2 )) ; then
  echo "usage: $0 target_dir count_to_skip"
  exit 1
fi
I=0
II=0
C=$(ls jpgs/*.jpg | wc -l)
for F in jpgs/*.jpg ; do
  if (( $I == 0 )) ; then
    echo -n -e cp $F "$1/" , "$II of $C\r"
    cp "$F" "$1/"
  fi
  I=$((I+1))
  II=$((II+1))
  if (( $I == $2 )) ; then
    I=0
    continue
  fi
done
echo
