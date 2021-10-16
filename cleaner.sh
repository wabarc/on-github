#!/bin/sh
#
# Clean old files

if [ -n "${DEBUG}" ]; then
    set -x
fi

clean() {
    tick=15
    if [ -n "${WAYBACK_CLEAN_TICK}" ]; then
        tick="${WAYBACK_CLEAN_TICK}"
    fi
    if [ -n "${WAYBACK_STORAGE_DIR}" ] && [ -d "${WAYBACK_STORAGE_DIR}" ]; then
        echo "Cleaning files on ${WAYBACK_STORAGE_DIR} ..."
        find "${WAYBACK_STORAGE_DIR}" -mmin +$tick -type f -exec rm {} +
    fi
}

clean
