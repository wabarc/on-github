#!/bin/sh

set -e pipefail

daemon=""
if [ -z "${WAYBACK_DAEMON##*telegram*}" ]; then
    daemon="-d telegram"
fi
if [ -z "${WAYBACK_DAEMON##*web*}" ]; then
    daemon="${daemon} -d web"
fi

args=""
if [ -z "${WAYBACK_TO##*ia*}" ]; then
    args="${args} --ia true"
fi
if [ -z "${WAYBACK_TO##*ip*}" ]; then
    args="${args} --is true"
fi
if [ -z "${WAYBACK_TO##*ip*}" ]; then
    args="${args} --ip true"
fi
if [ -z "${WAYBACK_TO##*ph*}" ]; then
    args="${args} --ph true"
fi

wayback $(echo "${daemon}" "${args}")
