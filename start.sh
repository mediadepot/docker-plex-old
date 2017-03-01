#!/usr/bin/env bash

#copied and modified from /usr/sbin/start_pms

export PLEX_MEDIA_SERVER_MAX_STACK_SIZE=3000
export PLEX_MEDIA_SERVER_TMPDIR=/tmp
export TMPDIR="${PLEX_MEDIA_SERVER_TMPDIR}"
export PLEX_MEDIA_SERVER_HOME="/srv/plex/app"
export PLEX_MEDIA_SERVER_APPLICATION_SUPPORT_DIR="/srv/plex/data"
export LD_LIBRARY_PATH="${PLEX_MEDIA_SERVER_HOME}"
export PLEX_USER=depot
export PLEX_MEDIA_SERVER_MAX_PLUGIN_PROCS=6
#export LC_ALL="en_US.UTF-8"
#export LANG="en_US.UTF-8"

echo $PLEX_MEDIA_SERVER_MAX_PLUGIN_PROCS $PLEX_MEDIA_SERVER_MAX_STACK_SIZE $PLEX_MEDIA_SERVER_APPLICATION_SUPPORT_DIR

ulimit -s $PLEX_MAX_STACK_SIZE

# Add sleep - Possible fix for start on boot.
sleep 3

/srv/plex/app/Plex\ Media\ Server