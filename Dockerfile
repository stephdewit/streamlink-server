FROM python:3.12-alpine
COPY --from=mwader/static-ffmpeg:9.0.2 /ffmpeg /usr/local/bin/ffmpeg
RUN pip install --no-cache-dir streamlink \
    && adduser -D app
USER app
EXPOSE 8080
COPY --chmod=755 entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
CMD []
