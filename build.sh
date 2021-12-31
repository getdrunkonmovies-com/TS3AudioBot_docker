 #!/bin/bash
 docker build -f Dockerfile \
    --build-arg "TS3_AUDIOBOT_RELEASE=0.12.0" \
    --build-arg TS3_AUDIOBOT_FLAVOUR=TS3AudioBot_dotnetcore3.1.zip \
    -t ancieque/ts3audiobot:0.12.0 \
    -t ancieque/ts3audiobot:latest \
    .

docker push ancieque/ts3audiobot:0.12.0
docker push ancieque/ts3audiobot:latest
