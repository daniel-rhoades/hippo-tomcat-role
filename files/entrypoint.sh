#!/bin/bash

set -eu

extract-distribution.sh ${USER_HOME}/distributions ${CATALINA_BASE}
exec $@