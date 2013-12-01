fswebcam --loop 60 -S 15 -F 5 -d v4l2:/dev/video0 -r 1024x768 -R --list-controls --save '%Y-%m-%d-%H%M%S.jpg'
