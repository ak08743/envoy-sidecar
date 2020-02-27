IMG_NAME ?= opsani/envoy-sidecar
IMG_TAG ?= v2

container:
	docker build . -t $(IMG_NAME):$(IMG_TAG)

push:
	docker push $(IMG_NAME):$(IMG_TAG)

