FROM jrottenberg/ffmpeg:4.4-ubuntu2004

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]