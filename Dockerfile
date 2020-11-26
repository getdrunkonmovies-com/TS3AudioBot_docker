FROM mcr.microsoft.com/dotnet/aspnet:3.1

# Which version and flavour of the audiobot to use
ARG TS3_AUDIOBOT_RELEASE="0.11.0"
ARG TS3_AUDIOBOT_FLAVOUR="TS3AudioBot_dotnet_core_3.1.zip"
# User id
ARG PUID=9999

ENV TS3_DLURL="https://github.com/Splamy/TS3AudioBot/releases/download"
ENV USER ts3bot
ENV BOTDIR /opt/TS3AudioBot
ENV DATADIR /data

# Install all pre-requisites, these will be needed always
RUN set -x \
# Install dependencies
	&& apt-get update \
	&& apt-get install -y --no-install-recommends --no-install-suggests \
		openssl \
		libopus-dev \
		opus-tools \
		ffmpeg \
		unzip \
		curl \
		python-pip \
	&& pip install youtube-dl \
# Add user
	&& useradd -ms /bin/bash -u "${PUID}" -m "${USER}" \
# download and install the TS3AudioBot in the specified version and flavour
	&& mkdir -p "${BOTDIR}" \
	&& curl -L "${TS3_DLURL}/${TS3_AUDIOBOT_RELEASE}/${TS3_AUDIOBOT_FLAVOUR}" -o TS3AudioBot.zip \
	&& unzip TS3AudioBot.zip -d "${BOTDIR}" \
# make data directory and chown it to the ts3bot user
	&& mkdir -p "${DATADIR}" \
	&& chown -R "${USER}":"${USER}" "${DATADIR}" \
# tidy up
	&& rm TS3AudioBot.zip \
# wipe packages not required for running the bot
	&& apt-get remove --purge -y \
		curl \
		unzip \
		python-pip \
		openssl \
	&& rm -rf /var/lib/apt/lists/*

# set user to ts3bot, we don't want to be root from now on
USER "${USER}"

# set the work dir to data, so users can properly mount their config files to this dir with -v /host/path/to/data:/data
WORKDIR "${DATADIR}"

CMD ["dotnet", "/opt/TS3AudioBot/TS3AudioBot.dll", "--non-interactive"]