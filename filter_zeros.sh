#!/usr/bin/bash
for a in kokot/*.jpg ; do D=`stat -c %s $a` ; if [ $D -eq 0 ] ; then echo nula $a ; cp jpgs/2013-11-28-112200.jpg $a ; fi ; done
