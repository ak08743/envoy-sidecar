# envoyproxy
Sidecar proxy container for collecting a pod's http metrics

## Supported environment variables:
* `LISTEN_PORT` : port Envoy should listen to
* `SERVICE_PORT` : port that serviced application listens to
* `METRICS_PORT` : port to collect Envoy metrics from
