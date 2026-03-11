# CCTV Streaming Pipeline (RTSP → HLS → Web Player)

A **Docker-based CCTV streaming system** that converts an RTSP stream into HLS and serves it to a web player.

This project simulates a **real CCTV camera pipeline** using a sample video and demonstrates how to build a scalable streaming architecture.

---

## Architecture

```
Video Source
(sample.mp4)
      │
      ▼
FFmpeg Publisher
      │ RTSP
      ▼
MediaMTX RTSP Server
      │
      ▼
FFmpeg Transcoder
      │ HLS
      ▼
Nginx HTTP Server
      │
      ▼
Web Player (Clappr)
```

---

## Components

### MediaMTX

RTSP server that receives the video stream.

* RTSP endpoint

```
rtsp://localhost:8554/sample
```

---

### FFmpeg Publisher

Publishes the sample video as a live RTSP stream.

```
sample.mp4 → RTSP
```

Command highlights:

* loops video indefinitely
* encodes using H264
* low latency settings

---

### FFmpeg HLS Transcoder

Converts RTSP stream to HLS.

Outputs:

```
master.m3u8
seg_00001.ts
seg_00002.ts
```

Configuration:

* 2 second segments
* rolling playlist
* low latency encoding

---

### Nginx

Serves HLS files via HTTP.

Stream URL:

```
http://localhost:8081/hls/master.m3u8
```

---

### Web Player

A simple web UI using Clappr.

Features:

* live playback
* bitrate selection
* stream stats overlay

Open:

```
http://localhost:8081
```

---

## Project Structure

```
cctv-docker
│
├── docker-compose.yml
├── Dockerfile.mediamtx
│
├── ffmpeg
│   ├── Dockerfile
│   ├── entrypoint.sh
│   ├── stream.sh
│   └── watchdog.sh
│
├── nginx
│   ├── conf.d
│   │   └── default.conf
│   ├── html
│   │   └── index.html
│   └── hls
│
└── rtsp-server
    └── media
        └── sample.mp4
```

---

## Running the Project

### 1 Install Docker

Install:

* Docker
* Docker Compose

---

### 2 Clone the repository

```
git clone https://github.com/<username>/cctv-docker.git
cd cctv-docker
```

---

### 3 Start the system

```
docker compose up --build
```

---

### 4 Open the stream

Web Player:

```
http://localhost:8081
```

Direct HLS stream:

```
http://localhost:8081/hls/master.m3u8
```

RTSP stream:

```
rtsp://localhost:8554/sample
```

---

## Use Cases

This architecture is useful for:

* CCTV camera streaming
* Smart city surveillance
* RTSP to HLS conversion
* Edge video processing
* Cloud video pipelines

---

## Future Improvements

* Multi-camera support
* Authentication
* WebRTC streaming
* Adaptive bitrate
* Recording and playback
* AI video analytics

---

## Technologies

* Docker
* FFmpeg
* MediaMTX
* Nginx
* HLS Streaming
* Clappr Player
