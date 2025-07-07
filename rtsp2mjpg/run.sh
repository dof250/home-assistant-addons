#!/bin/bash

RTSP_URL=$(jq -r .rtsp_url /data/options.json)

ffmpeg -rtsp_transport tcp -i "$RTSP_URL" -f mjpeg -q:v 5 -r 5 -s 640x360 - | \
  ffmpeg -f mjpeg -i - -f mpjpeg -listen 1 -i - -fflags nobuffer http://0.0.0.0:8080/live.mjpg