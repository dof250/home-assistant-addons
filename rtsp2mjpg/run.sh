#!/bin/bash

RTSP_URL=$(jq -r .rtsp_url /data/options.json)
echo "RTSP_URL: $RTSP_URL"

if [ -z "$RTSP_URL" ]; then
  echo "❌ Geen RTSP URL opgegeven. Check config!"
  exit 1
fi

ffmpeg -rtsp_transport tcp -i "$RTSP_URL" -f mjpeg -q:v 5 -r 5 -s 640x360 - | \
  ffmpeg -f mjpeg -i - -f mpjpeg -listen 1 -i - -fflags nobuffer http://0.0.0.0:8080/live.mjpg