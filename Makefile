IMG_NAME ?= ak9164515/envoy-sidecar
IMG_TAG ?= experimental

container:
	docker build . -t $(IMG_NAME):$(IMG_TAG)

push:
	docker push $(IMG_NAME):$(IMG_TAG)
