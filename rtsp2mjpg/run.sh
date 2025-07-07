#!/bin/bash

RTSP_URL=$(jq -r .rtsp_url /data/options.json)
echo "RTSP_URL: $RTSP_URL"

if [ -z "$RTSP_URL" ]; then
  echo "❌ Geen RTSP URL opgegeven. Check config!"
  exit 1
fi

ffmpeg -rtsp_transport tcp -i "$RTSP_URL" -f mpjpeg -q:v 5 -r 5 -s 640x360 -listen 1 -fflags nobuffer http://0.0.0.0:8080/live.mjpg