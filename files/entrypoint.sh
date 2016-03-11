#!/bin/bash

set -eu

if [ -n "${HIPPO_DISTRO_URL+1}" ]
then
  echo 'Distribution found'
  wget $HIPPO_DISTRO_URL -P ${USER_HOME}/downloads
  extract-distribution.sh ${USER_HOME}/downloads ${CATALINA_BASE}
else
  echo 'No distribution'
  extract-distribution.sh ${USER_HOME}/distributions ${CATALINA_BASE}
fi

exec $@