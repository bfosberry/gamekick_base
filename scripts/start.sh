#!/bin/bash
# @author bfosberry

if [ -z $SERVER_ID ]; then
  echo "No Server Id provided"
  exit 1
fi

if type install_components >/dev/null 2>&1; then
  install_components
fi

if type write_config >/dev/null 2>&1; then
  write_config
fi

bash --login -c run
