#!/usr/bin/bash
rsync --progress -u pi@gorgorod:~/webcam/*.jpg jpgs/
rm 0/*.jpg
./skipframes.sh 0/ 12
rm 1/*.jpg
./two_means.py 1/ 0/*.jpg
./enc.sh 1 60
A=$(ls -t output_video*.avi | head -n 1)
echo $A
