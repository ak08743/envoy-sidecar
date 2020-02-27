#FROM lyft/envoy:latest
FROM envoyproxy/envoy:latest

RUN apt-get update && apt-get -q install -y curl dnsutils tcpdump wget procps gettext-base

COPY envoy.json /etc/envoy.json.template
COPY startup.sh /

RUN chmod +x /startup.sh

ENV ENVOY_PORT=15001  \
    METRICS_PORT=9901

CMD /startup.sh

