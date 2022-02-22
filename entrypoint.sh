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

if [ -n "${WAYBACK_TOR_LOCAL_PORT}" ]; then
    export PORT=$WAYBACK_TOR_LOCAL_PORT
fi

if [ -z "${CHROMEDP_NO_SANDBOX}" ]; then
    export CHROMEDP_NO_SANDBOX=true
fi
if [ -z "${CHROMEDP_DISABLE_GPU}" ]; then
    export CHROMEDP_DISABLE_GPU=true
fi
if [ -z "${CHROMEDP_NO_HEADLESS}" ]; then
    export CHROMEDP_NO_HEADLESS=false
fi
if [ -z "${CHROMEDP_USER_AGENT}" ]; then
    export CHROMEDP_USER_AGENT="Mozilla/5.0 (en-us) AppleWebKit/525.13 (KHTML, like Gecko) Version/3.1 Safari/525.13"
fi

if [ -f "wayback.conf" ]; then
    args="${args} --config wayback.conf"
fi

wayback $(echo "${daemon}" "${args}")
