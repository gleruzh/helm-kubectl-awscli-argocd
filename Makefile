default: docker
include .env

# Note:
#	Latest version of kubectl may be found at: https://github.com/kubernetes/kubernetes/releases
# 	Latest version of helm may be found at: https://github.com/kubernetes/helm/releases
# 	Latest version of yq may be found at: https://github.com/mikefarah/yq/releases
VARS:=$(shell sed -ne 's/ *\#.*$$//; /./ s/=.*$$// p' .env )
$(foreach v,$(VARS),$(eval $(shell echo export $(v)="$($(v))")))
DOCKER_IMAGE ?= ghcr.io/gleruzh/helm-kubectl-awscli-argocd
DOCKER_TAG ?= `git rev-parse --short HEAD`

docker:
	@docker buildx build \
	  --build-arg KUBE_VERSION=$(KUBE_VERSION) \
	  --build-arg HELM_VERSION=$(HELM_VERSION) \
	  --build-arg YQ_VERSION=$(YQ_VERSION) \
	  --platform linux/amd64 \
	  -t $(DOCKER_IMAGE):$(DOCKER_TAG) -t $(DOCKER_IMAGE):latest .