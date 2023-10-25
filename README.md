[![ci](https://github.com/gleruzh/helm-kubectl-awscli-argocd/actions/workflows/image-build-push.yml/badge.svg)](https://github.com/gleruzh/helm-kubectl-awscli-argocd/actions/workflows/image-build-push.yml)
<!-- [START BADGES] -->
<!-- Please keep comment here to allow auto update -->
[![MIT License](https://img.shields.io/github/license/gleruzh/helm-kubectl-awscli-argocd?style=flat-square)](https://github.com/gleruzh/helm-kubectl-awscli-argocd/blob/master/LICENSE)
[![Helm version](https://img.shields.io/static/v1?label=&labelColor=white&message=helm-v3.12.0&color=0F1689&style=flat-square&logo=helm&logoColor=0F1689)](https://github.com/helm/helm/releases/tag/v3.12.0)
[![Kubectl version](https://img.shields.io/static/v1?label=&labelColor=white&message=kubernetes-v1.28.2&color=326CE5&style=flat-square&logo=kubernetes&logoColor=326CE5)](https://github.com/kubernetes/kubernetes/releases/tag/v1.28.2)
[![ArgoCD CLI version](https://img.shields.io/static/v1?label=&labelColor=white&message=argocd-v2.8.4&color=EF7B4D&style=flat-square&logo=argo&logoColor=EF7B4D)](https://github.com/argoproj/argo-cd/releases/tag/v2.8.4)
[![AWS CLI version](https://img.shields.io/static/v1?label=&labelColor=white&message=awscli-v1.29.70&color=232F3E&style=flat-square&logo=argo&logoColor=232F3E)](https://github.com/aws/aws-cli/releases/tag/1.29.70)
[![yq version](https://img.shields.io/static/v1?label=&labelColor=white&message=jq-v4.33.3&color=yellow&style=flat-square)](https://github.com/mikefarah/yq/releases/tag/v4.33.3)
<!-- [END BADGES] -->
## helm-kubernetes Docker image with the AWS CLI and ArgoCD CLI
This is a fork of
https://github.com/petebachant/helm-kubectl-awscli
that adds the argocd CLI.

### Build

For doing a manual local build of the image run `make docker`.
