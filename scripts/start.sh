#!/bin/bash
# @author bfosberry
. gamekick_common

if [ -z _$SERVER_ID ]; then
  echo "No Server Id provided"
  exit 1
fi


dump_config

if type install_components >/dev/null 2>&1; then
  install_components
fi

if type write_config >/dev/null 2>&1; then
  write_config
fi

run