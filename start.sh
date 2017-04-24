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

# print the env
env

# check for the latest version of the plex app.
LATEST_PLEX_VERSION=$(curl -L https://plex.tv/api/downloads/1.json | jq -r '.computer.Linux.releases[0].url')


if [ "$LATEST_PLEX_VERSION" = "$(cat /srv/plex/version.txt)" ]; then
  echo "Plex version unchanged."
else
  echo "Plex version has changed."
  echo "-- Current version from: $(cat /srv/plex/version.txt)"
  echo "-- Latest version from: $LATEST_PLEX_VERSION"

  echo "$LATEST_PLEX_VERSION" > /srv/plex/version.txt
  curl -L $(cat /srv/plex/version.txt) -o plexmediaserver.deb && \
  dpkg -i plexmediaserver.deb && \
  rm  /plexmediaserver.deb

  # remove the old plex installation.
  rm -rf $PLEX_MEDIA_SERVER_HOME
  mkdir -p $PLEX_MEDIA_SERVER_HOME
  cp -R /usr/lib/plexmediaserver/. $PLEX_MEDIA_SERVER_HOME
  rm -rf /usr/lib/plexmediaserver

  chown -R depot:depot /srv/plex
fi


ulimit -s $PLEX_MAX_STACK_SIZE

# Add sleep - Possible fix for start on boot.
sleep 3

/srv/plex/app/Plex\ Media\ Server