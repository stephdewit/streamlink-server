#!/bin/sh
set -e

# Arguments given on the command line take precedence over the environment.
if [ "$#" -eq 0 ] && [ -n "$STREAM_URL" ]; then
    set -- "$STREAM_URL" "${STREAM_QUALITY:-best}"
fi

exec streamlink --player-external-http \
    --player-external-http-interface 0.0.0.0 \
    --player-external-http-port 8080 \
    "$@"
