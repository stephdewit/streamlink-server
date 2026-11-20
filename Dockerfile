FROM python:3.15-alpine
COPY --from=mwader/static-ffmpeg:9.0.2 /ffmpeg /usr/local/bin/ffmpeg
COPY requirements.txt /tmp/requirements.txt
RUN pip install --no-cache-dir -r /tmp/requirements.txt \
    && rm /tmp/requirements.txt \
    && adduser -D app
USER app
EXPOSE 8080
COPY --chmod=755 entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
CMD []
