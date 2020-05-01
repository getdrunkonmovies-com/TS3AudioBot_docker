# TS3AudioBot_docker

Dockerfile for TS3AudioBot. Uses `mcr.microsoft.com/dotnet/core/sdk:3.1-bionic` as a base image

## Building

To build the docker image with all the defaults, run:

```
docker build -f Dockerfile -t local.docker.image/ts3audiobot:latest .
```

### Specific Version

To build the docker image with a specific version of TS3AudioBot, run:

```
docker build -f Dockerfile --build-arg TS3_AUDIOBOT_RELEASE=0.11.0 -t local.docker.image/ts3audiobot:0.11.0 .
```

### Specific Flavour

To build the docker image in a specific flavour (default is `TS3AudioBot_dotnet_core_3.1.zip`), run:

```
docker build -f Dockerfile --build-arg TS3_AUDIOBOT_FLAVOUR=TS3AudioBot_dotnet_core_3.1.zip -t local.docker.image/ts3audiobot:0.11.0 .
```