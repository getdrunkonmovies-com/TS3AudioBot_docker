 #!/bin/bash
 docker build -f Dockerfile \
    --build-arg TS3_AUDIOBOT_FLAVOUR=TS3AudioBot_dotnet_core_3.1.zip \
    -t docker.pkg.github.com/getdrunkonmovies-com/ts3audiobot_docker/ts3audiobot:0.11.0 \
    -t docker.pkg.github.com/getdrunkonmovies-com/ts3audiobot_docker/ts3audiobot:latest \
    .

docker push docker.pkg.github.com/getdrunkonmovies-com/ts3audiobot_docker/ts3audiobot:0.11.0
docker push docker.pkg.github.com/getdrunkonmovies-com/ts3audiobot_docker/ts3audiobot:latest