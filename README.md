Run the [Nightly](https://www.mozilla.org/en-US/firefox/channel/desktop/) build of Firefox for Linux in Docker

The script is optimized to work on an OSX host, but may work on other host operationg systems adequately.

== Pre-requisites

* [Docker](https://docs.docker.com/docker-for-mac/install/)
* [XQuartz](https://www.xquartz.org/) (make sure you've got 2.7.11 or higher)
* [PulseAudio](https://www.freedesktop.org/wiki/Software/PulseAudio/).  Install with `brew install pulseaudio`.  This is only required if you want sound to work.

== Running

* `git clone https://github.com/hildjj/firefox-nightly-docker.git`
* `cd firefox-nightly-docker`
* `./firefox-nightly [URL]`

[Docker Hub](https://hub.docker.com/r/hildjj/firefox-nightly/)