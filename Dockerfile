#FROM lyft/envoy:latest
FROM opsani/envoy:v6

RUN apt-get update && apt-get -q install -y curl dnsutils tcpdump wget procps gettext-base

COPY header.yaml.template backend.yaml.template listener.yaml.template /
COPY startup.sh /

RUN chmod +x /startup.sh

ENV PROXY_PORTS="8080"  \
    METRICS_PORT="9901" \
    SERVICE_HOST="127.0.0.1"

CMD /startup.sh

