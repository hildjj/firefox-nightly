FROM ubuntu:devel
LABEL maintainer "Joe Hildebrand <joe-github@cursive.net>"

RUN apt-get update && apt-get upgrade -y && apt-get install -y \
	bzip2 \
	ca-certificates \
	consolekit \
	dbus-x11 \
	dirmngr \
	fonts-dejavu \
	fonts-liberation \
	fonts-noto \
	fonts-lyx \
	gnupg \
	hicolor-icon-theme \
	libasound2 \
	libatk1.0-0 \
	libc6 \
	libcairo-gobject2 \
	libcairo2 \
	libcanberra0 \
	libdbus-1-3 \
	libdbus-glib-1-2 \
	libdbusmenu-glib4 \
	libdbusmenu-gtk4 \
	libfontconfig1 \
	libfreetype6 \
	libgcc1 \
	libgdk-pixbuf2.0-0 \
	libgl1-mesa-dri \
	libgl1-mesa-glx \
	libglib2.0-0 \
	libgtk-3-0 \
	libgtk2.0-0 \
	libpango-1.0-0 \
	libstartup-notification0 \
	libstdc++6 \
	libx11-6 \
	libx11-xcb1 \
	libxcb-shm0 \
	libxcb1 \
	libxcomposite1 \
	libxdamage1 \
	libxext6 \
	libxfixes3 \
	libxrender1 \
	libxt6 \
	locales \
	lsb-release \
	pulseaudio \
	pulseaudio-utils \
	wget \
	xauth \
	--no-install-recommends \
&& update-locale LANG=C.UTF-8 LC_MESSAGES=POSIX \
&& dbus-uuidgen > /etc/machine-id

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys ADA83EDC62D7EDF8 \
	&& echo "deb http://ppa.launchpad.net/eosrei/fonts/ubuntu devel main" >> /etc/apt/sources.list.d/eosrei-ubuntu-fonts-artful.list \
	&& apt-get update \
	&& apt-get install -y fonts-emojione-svginot

RUN service dbus start
WORKDIR /tmp

ARG BUILD_DATE=1
RUN wget -q -O nightly.tar.bz 'https://download.mozilla.org/?product=firefox-nightly-latest-ssl&os=linux64&lang=en-US' \
	&& tar xjf nightly.tar.bz \
	&& rm -f nightly.tar.bz

ENV HOME /tmp/firefox-nightly
WORKDIR /tmp/firefox-nightly

ENTRYPOINT ["/tmp/firefox/firefox"]
CMD ["https://github.com/hildjj/firefox-nightly-docker"]