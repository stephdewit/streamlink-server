# streamlink-server

Docker image that wraps [Streamlink](https://streamlink.github.io/) and serves a stream over HTTP, using its built-in `--player-external-http` option.

## Build

```bash
docker build -t streamlink-server .
```

## Run

Pass the source URL and quality as arguments:

```bash
docker run --rm -p 8080:8080 streamlink-server https://twitch.tv/somechannel best
```

Or set them through environment variables (`STREAM_QUALITY` defaults to `best`):

```bash
docker run --rm -p 8080:8080 \
  -e STREAM_URL=https://twitch.tv/somechannel -e STREAM_QUALITY=720p \
  streamlink-server
```

Arguments, when given, take precedence over the environment variables.

Then open it in a player:

```bash
vlc http://localhost:8080/
# or: mpv http://localhost:8080/
```

The server waits for a client to connect before fetching the stream.

## Notes

- One container serves one stream. To serve another, start a second container on a different port (e.g. `-p 8081:8080`).
- Any other Streamlink option can be added before the URL, e.g. `--twitch-api-header "Authorization=OAuth <token>"`.
- Output is MPEG-TS, which suits players like VLC or mpv but not a browser `<video>` tag.
- Run `docker run --rm streamlink-server --help` to see Streamlink's help.
