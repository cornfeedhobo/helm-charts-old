# k3os-bootstrap

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.0.0](https://img.shields.io/badge/AppVersion-0.0.0-informational?style=flat-square)

A Helm chart for bootstrapping k3os with cert-manager and rancher.

## Usage

A bare minimum config requires setting `rancher.hostname` and `clusterIssuer.email`:

```yaml
rancher:
  hostname: "www.example.com"
clusterIssuer:
  email: "admin@example.com"
```

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| cornfeedhobo | cornfeedhobo@fuzzlabs.org |  |

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://charts.jetstack.io | cert-manager | v1.8.0 |
| https://releases.rancher.com/server-charts/latest | rancher | 2.6.4 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| cert-manager.ingressShim.defaultIssuerName | string | `"letsencrypt-production"` |  |
| cert-manager.installCRDs | bool | `true` |  |
| cert-manager.prometheus.servicemonitor.enabled | bool | `true` |  |
| clusterIssuer.email | string | `""` |  |
| clusterIssuer.name | string | `"letsencrypt-production"` |  |
| clusterIssuer.server | string | `"https://acme-v02.api.letsencrypt.org/directory"` |  |
| rancher.hostname | string | `""` |  |
| rancher.ingress.extraAnnotations."cert-manager.io/issuer" | string | `"letsencrypt-production"` |  |
| rancher.ingress.extraAnnotations."cert-manager.io/issuer-kind" | string | `"ClusterIssuer"` |  |
| rancher.ingress.includeDefaultExtraAnnotations | bool | `false` |  |
| rancher.ingress.tls.source | string | `"secret"` |  |
