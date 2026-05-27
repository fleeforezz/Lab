#!/bin/bash

LOGFILE="/var/log/hello/hello.log"
mkdir -p /var/log/hello

log() {
  local entry="$(date '+%Y-%m-%dT%H:%M:%S') level=$1 msg=\"$2\""
  echo "$entry"               # still prints to terminal
  echo "$entry" >> "$LOGFILE" # AND writes to file
}

log "info" "Script started"
log "info" "Doing something"

if ! some_command; then
  log "error" "some_command failed"
  exit 1
fi

log "info" "Script finished"