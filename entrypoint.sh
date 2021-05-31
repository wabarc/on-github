#!/bin/sh

set -e pipefail

daemon=""
if [ -z "${WAYBACK_DAEMON##*mastodon*}" ]; then
    daemon="-d mastodon"
fi
if [ -z "${WAYBACK_DAEMON##*telegram*}" ]; then
    daemon="${daemon} -d telegram"
fi
if [ -z "${WAYBACK_DAEMON##*twitter*}" ]; then
    daemon="${daemon} -d twitter"
fi
if [ -z "${WAYBACK_DAEMON##*web*}" ]; then
    daemon="${daemon} -d web"
fi
if [ -z "${WAYBACK_DAEMON##*irc*}" ]; then
    daemon="${daemon} -d irc"
fi
if [ -z "${WAYBACK_DAEMON##*matrix*}" ]; then
    daemon="${daemon} -d matrix"
fi

args=""
if [ -z "${WAYBACK_TO##*ia*}" ]; then
    args="${args} --ia true"
fi
if [ -z "${WAYBACK_TO##*is*}" ]; then
    args="${args} --is true"
fi
if [ -z "${WAYBACK_TO##*ip*}" ]; then
    args="${args} --ip true"
fi
if [ -z "${WAYBACK_TO##*ph*}" ]; then
    args="${args} --ph true"
fi

if [ -f "wayback.conf" ]; then
    args="${args} --config wayback.conf"
fi

wayback $(echo "${daemon}" "${args}")
