ARG BUILDPLATFORM
FROM ${BUILDPLATFORM}alpine:3

ARG KUBE_VERSION
ARG HELM_VERSION
ARG TARGETOS
ARG TARGETARCH
ARG YQ_VERSION

RUN apk -U upgrade \
    && apk add --no-cache ca-certificates bash git openssh curl gettext jq python3 groff mandoc

RUN wget -q https://storage.googleapis.com/kubernetes-release/release/v${KUBE_VERSION}/bin/${TARGETOS}/${TARGETARCH}/kubectl -O /usr/local/bin/kubectl \
    && wget -q https://get.helm.sh/helm-v${HELM_VERSION}-${TARGETOS}-${TARGETARCH}.tar.gz -O - | tar -xzO ${TARGETOS}-${TARGETARCH}/helm > /usr/local/bin/helm \
    && wget -q https://github.com/mikefarah/yq/releases/download/v${YQ_VERSION}/yq_${TARGETOS}_${TARGETARCH} -O /usr/local/bin/yq \
    && chmod +x /usr/local/bin/helm /usr/local/bin/kubectl /usr/local/bin/yq \
    && mkdir /work \
    && chmod g+rwx /root /work \
    && helm repo add "stable" "https://charts.helm.sh/stable" --force-update \
    && kubectl version --client \
    && helm version

# From https://stackoverflow.com/a/62555259
ENV PYTHONUNBUFFERED=1
RUN ln -sf python3 /usr/bin/python
RUN python3 -m ensurepip
RUN pip3 install --no-cache --upgrade pip setuptools awscli

# From https://argo-cd.readthedocs.io/en/stable/cli_installation/
RUN curl -sSL -o argocd-linux-amd64 https://github.com/argoproj/argo-cd/releases/latest/download/argocd-linux-amd64
RUN install -m 555 argocd-linux-amd64 /usr/local/bin/argocd
RUN argocd version --client && rm argocd-linux-amd64
    
WORKDIR /work

CMD bash
