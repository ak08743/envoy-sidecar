#!/bin/bash
CONFIG="/etc/envoy.yaml"

{
  cat header.yaml.template | envsubst
  echo "  clusters:"
  for PORT in $PROXY_PORTS; do
    export PORT
    cat backend.yaml.template | envsubst
  done
  echo "  listeners:"
  for PORT in $PROXY_PORTS; do
    export PORT
    cat listener.yaml.template | envsubst
  done
} > $CONFIG

/usr/local/bin/envoy -c $CONFIG

