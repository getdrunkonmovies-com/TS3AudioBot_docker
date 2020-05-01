FROM mcr.microsoft.com/dotnet/core/sdk:3.1-bionic

# install all pre-requisites, these will be needed always
RUN apt-get update && apt-get install -y \
      openssl \
      libopus-dev \
      opus-tools \
      ffmpeg \
      zip

# which version and flavour of the audiobot to use
ARG TS3_AUDIOBOT_RELEASE="0.11.0"
ARG TS3_AUDIOBOT_FLAVOUR="TS3AudioBot_dotnet_core_3.1.zip"

# download and install the TS3AudioBot in the specified version and flavour
RUN mkdir -p /opt/TS3AudioBot \
    && cd /opt/TS3AudioBot \
    && curl -L https://github.com/Splamy/TS3AudioBot/releases/download/${TS3_AUDIOBOT_RELEASE}/${TS3_AUDIOBOT_FLAVOUR} -o TS3AudioBot.zip \
    && unzip TS3AudioBot.zip

# define this here so we can reuse the above layers
ARG TS3_AUDIOBOT_INCLUDE_YOUTUBE_DL="true"

# install and setup youtube-dl if configured
RUN bash -c 'if [ "xy$TS3_AUDIOBOT_INCLUDE_YOUTUBE_DL" == "xytrue" ] ; then \
        apt-get update && apt-get install -y python3 \
        && update-alternatives --install /usr/bin/python python /usr/bin/python3 99 \
        && curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl && chmod a+rx /usr/local/bin/youtube-dl ; \
    else \
        echo "skipping setup for youtube-dl"; \
    fi'

# set the work dir to data, so users can properly mount their config files to this dir with -v /host/path/to/data:/data
WORKDIR /data

CMD ["dotnet", "/opt/TS3AudioBot/TS3AudioBot.dll"]