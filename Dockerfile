FROM alpine AS patch
COPY listener.yaml.template.patch /
COPY --from=ak9164515/envoy-sidecar:v3 /listener.yaml.template /listener.yaml.template
RUN  patch /listener.yaml.template  /listener.yaml.template.patch


FROM ak9164515/envoy-sidecar:v3
COPY --from=patch /listener.yaml.template  /listener.yaml.template
