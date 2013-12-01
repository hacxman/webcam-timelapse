#!/bin/bash
if (( $# < 2 )) ; then
  echo "usage: $0 source_dir FPS"
  exit 1
fi
FPS=$2
#FPS=20
mencoder 'mf://'"$1"'/*.jpg' -mf fps=$FPS -oac copy -ovc x264 -x264encopts pass=1:preset=medium:fast_pskip=0:tune=film:frameref=5:bitrate=2000:threads=auto -o /dev/null
mencoder 'mf://'"$1"'/*.jpg' -mf fps=$FPS -oac copy -ovc x264 -x264encopts pass=2:preset=medium:fast_pskip=0:tune=film:frameref=5:bitrate=2000:threads=auto -o output_video_$(date +%s).avi

#mencoder 'mf://trolol/*.jpg' -mf fps=$FPS -oac copy -ovc x264 -x264encopts pass=2:preset=medium:fast_pskip=0:tune=film:frameref=5:bitrate=2000:threads=auto -o output_video_$(date +%s).avi

