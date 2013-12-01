#!/bin/bash
I=0
for F in jpgs/*.jpg ; do
  if (( $I == 0 )) ; then
    echo cp $F kokot/
    cp "$F" kokot/
  fi
  I=$((I+1))
  if (( $I == 4 )) ; then
  #if [ $I -eq 12 ] ; then
    I=0
    continue
  fi
done
