#!/bin/bash
envsubst < /etc/envoy.json.template > /etc/envoy.json
/usr/local/bin/envoy -c /etc/envoy.json

