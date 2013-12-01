#!/usr/bin/bash
rsync --progress -u pi@gorgorod:~/webcam/*.jpg jpgs/
./skipframes.sh
./filter_zeros.sh
./enc.sh
