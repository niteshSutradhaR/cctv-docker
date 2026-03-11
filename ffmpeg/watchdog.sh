while true; do
  sleep 10
  if [ ! -f /hls/stream_0.m3u8 ]; then
    echo "[watchdog] HLS master playlist not found. Restarting FFmpeg..."
    pkill -f ffmpeg
  fi
  sleep 10
done