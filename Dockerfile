FROM ubuntu:devel
LABEL maintainer "Joe Hildebrand <joe-github@cursive.net>"

RUN apt-get update && apt-get upgrade -y && apt-get install -y \
	consolekit \
	dirmngr \
	gnupg \
	ca-certificates \
	dbus-x11 \
	fonts-dejavu fonts-liberation \
	hicolor-icon-theme \
	libasound2 \
	libgl1-mesa-dri \
	libgl1-mesa-glx \
	locales \
	pulseaudio \
	pulseaudio-utils \
	xauth \
	--no-install-recommends \
&& update-locale LANG=C.UTF-8 LC_MESSAGES=POSIX \
&& dbus-uuidgen > /etc/machine-id

ARG BUILD_DATE=1
RUN	apt-key adv --keyserver keyserver.ubuntu.com --recv-keys b34505ea326feaea07e3618def4186fe247510be \
	&& echo "deb http://ppa.launchpad.net/ubuntu-mozilla-daily/ppa/ubuntu devel main" >> /etc/apt/sources.list.d/firefox.list \
	&& apt-get update \
	&& apt-get install -y \
	firefox-trunk \
	&& apt-get purge -y xul-ext-ubufox

RUN service dbus start

ENV HOME /tmp/firefox-nightly
WORKDIR /tmp/firefox-nightly

ENTRYPOINT ["firefox-trunk"]
CMD ["https://github.com/hildjj/firefox-nightly-docker"]