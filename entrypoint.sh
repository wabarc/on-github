#!/bin/sh

set -e pipefail

daemon=""
if echo "${WAYBACK_DAEMON}" | grep -q "telegram"; then
    daemon="${daemon} -d telegram"
fi
if echo "${WAYBACK_DAEMON}" | grep -q "mastodon"; then
    daemon="${daemon} -d mastodon"
fi
if echo "${WAYBACK_DAEMON}" | grep -q "twitter"; then
    daemon="${daemon} -d twitter"
fi
if echo "${WAYBACK_DAEMON}" | grep -q "discord"; then
    daemon="${daemon} -d discord"
fi
if echo "${WAYBACK_DAEMON}" | grep -q "slack"; then
    daemon="${daemon} -d slack"
fi
if echo "${WAYBACK_DAEMON}" | grep -q "web"; then
    daemon="${daemon} -d web"
fi
if echo "${WAYBACK_DAEMON}" | grep -q "irc"; then
    daemon="${daemon} -d irc"
fi
if echo "${WAYBACK_DAEMON}" | grep -q "matrix"; then
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
