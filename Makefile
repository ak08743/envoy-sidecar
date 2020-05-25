IMG_NAME ?= opsani/envoy-proxy
IMG_TAG ?= v4

container:
	docker build . -t $(IMG_NAME):$(IMG_TAG)

push:
	docker push $(IMG_NAME):$(IMG_TAG)
