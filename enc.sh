#!/bin/bash
FPS=260
#FPS=20
mencoder 'mf://trolol/*.jpg' -mf fps=$FPS -oac copy -ovc x264 -x264encopts pass=1:preset=medium:fast_pskip=0:tune=film:frameref=5:bitrate=2000:threads=auto -o /dev/null
mencoder 'mf://trolol/*.jpg' -mf fps=$FPS -oac copy -ovc x264 -x264encopts pass=2:preset=medium:fast_pskip=0:tune=film:frameref=5:bitrate=2000:threads=auto -o output_video_$(date +%s).avi

