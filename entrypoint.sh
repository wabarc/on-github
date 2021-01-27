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
if [ -n "${WAYBACK_ENABLE_IA}" ]; then
    args="${args} --ia true"
fi
if [ -n "${WAYBACK_ENABLE_IS}" ]; then
    args="${args} --is true"
fi
if [ -n "${WAYBACK_ENABLE_IP}" ]; then
    args="${args} --ip true"
fi
if [ -n "${WAYBACK_ENABLE_PH}" ]; then
    args="${args} --ph true"
fi

wayback $(echo "${daemon}" "${args}")
