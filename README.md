# TS3AudioBot_docker

Dockerfile for [TS3AudioBot](https://github.com/Splamy/TS3AudioBot). Uses `mcr.microsoft.com/dotnet/aspnet:3.1` as a base image

Docker Hub:

https://hub.docker.com/r/ancieque/ts3audiobot

## Running the container

Setup the data directory

```
mkdir -p $(pwd)/data
chown -R 9999:9999 $(pwd)/data
```

Run the initial setup to generate all the initial configuration files:

```
docker run --rm -v $(pwd)/data:/data -it ancieque/ts3audiobot:0.11.0
```

After the initial configuration setup has finished, stop the server with CTRL-C and 
configure your bot in the configuration files accordingly. Then run the actual container again as a daemon:

```
docker run --name ts3audiobot -d -v $(pwd)/data:/data ancieque/ts3audiobot:0.11.0
```

If you want to use the webapi, you can also expose the web server on port 58913:
```
docker run --name ts3audiobot -d -v $(pwd)/data:/data -p 58913:58913 ancieque/ts3audiobot:0.11.0
```

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
