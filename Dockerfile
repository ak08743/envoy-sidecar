#FROM lyft/envoy:latest
FROM envoyproxy/envoy:latest

RUN apt-get update && apt-get -q install -y curl dnsutils tcpdump wget procps gettext-base

COPY envoy.json.template /etc/envoy.json.template
COPY startup.sh /

RUN chmod +x /startup.sh

ENV LISTEN_PORT=8080  \
    SERVICE_PORT=80   \
    METRICS_PORT=9901

CMD /startup.sh

