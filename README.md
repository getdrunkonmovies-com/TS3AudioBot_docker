# TS3AudioBot_docker

[![ancieque/ts3audiobot](https://img.shields.io/docker/pulls/ancieque/ts3audiobot)](https://hub.docker.com/r/ancieque/ts3audiobot)

Dockerfile for [TS3AudioBot](https://github.com/Splamy/TS3AudioBot).
Uses `mcr.microsoft.com/dotnet/core/aspnet:3.1-alpine` as a base image.

Youtube-dl is installed per default.

**Docker Hub:**

https://hub.docker.com/r/ancieque/ts3audiobot

## Running the container

Setup the data directory

```bash
mkdir -p $(pwd)/data
chown -R 9999:9999 $(pwd)/data
```

Run the initial setup to generate all the initial configuration files:

```bash
docker run --rm -v $(pwd)/data:/data -it ancieque/ts3audiobot:0.12.0
```

After the initial configuration setup has finished, stop the server with CTRL-C and 
configure your bot in the configuration files accordingly. Then run the actual container again as a daemon:

```bash
docker run --name ts3audiobot -d -v $(pwd)/data:/data ancieque/ts3audiobot:0.12.0
```

## Building

To build the docker image with all the defaults, run:

```bash
docker build -f Dockerfile -t local.docker.image/ts3audiobot:latest .
```

### Specific Version

To build the docker image with a specific version of TS3AudioBot, run:

```bash
docker build -f Dockerfile --build-arg TS3_AUDIOBOT_RELEASE=0.12.0 -t local.docker.image/ts3audiobot:0.12.0 .
```

### Specific Flavour

To build the docker image in a specific flavour (default is `TS3AudioBot_dotnetcore3.1.zip`), run:

```bash
docker build -f Dockerfile --build-arg TS3_AUDIOBOT_FLAVOUR=TS3AudioBot_dotnetcore3.1.zip -t local.docker.image/ts3audiobot:0.12.0 .
```

### Other service user id

To build the docker image to use another user id, run:

```bash
docker build -f Dockerfile --build-arg PUID=9987 -t local.docker.image/ts3audiobot:0.12.0 .
```
