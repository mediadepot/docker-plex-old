#!/usr/bin/env bash

export PLEX_MEDIA_SERVER_HOME="/srv/plex/app"
export PLEX_MEDIA_SERVER_APPLICATION_SUPPORT_DIR="/srv/plex/data"
export LD_LIBRARY_PATH="${PLEX_MEDIA_SERVER_HOME}"
export PLEX_USER=plex
export PLEX_MEDIA_SERVER_MAX_PLUGIN_PROCS=6
export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"
ulimit -s 3000
/srv/plex/app/Plex\ Media\ Server