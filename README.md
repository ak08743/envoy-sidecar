# envoyproxy
Sidecar proxy container for collecting a pod's http metrics

Supports environment variables:
* ENVOY_PORT: port that Envoy is listening to, default is 15001
* METRICS_PORT: port that metrics is available at, default is 9901

To add to the deployment, add to the containers section:
```
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx
spec:
  selector:
    matchLabels:
      app: nginx
  replicas: 2
  template:
    metadata:
      labels:
        app: nginx
      annotations:
        prometheus.io/path: /stats/prometheus
        prometheus.io/scrape: 'true'
        prometheus.io/port: '9901'
    spec:
      containers:
      - name: nginx
        image: nginx:1.7.9
        ports:
        - containerPort: 80
      - name: envoy
        image: opsani/envoy-sidecar:v2
        imagePullPolicy: Always
        env:
        - name: ENVOY_PORT
          value: "15001"
        - name: METRICS_PORT
          value: "9901"
        ports:
          - containerPort: 9901
            name: metrics
        resources:
          limits:
            cpu: 100m
            memory: 512Mi
          requests:
            cpu: 100m
            memory: 512Mi

```

An init container from opsani/envoy-sidecar-init might be required.
