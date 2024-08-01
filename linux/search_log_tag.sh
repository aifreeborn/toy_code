#!/bin/bash


find ./ -type f -name \*.c | xargs awk 'BEGIN {FS="\""; log_tag="logcat -s"} /^\s*#define\s* LOG_TAG/{log_tag=log_tag" "$2} END {print log_tag}'
