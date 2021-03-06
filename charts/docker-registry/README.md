# docker-registry

![Version: 0.4.0](https://img.shields.io/badge/Version-0.4.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 2.8.1](https://img.shields.io/badge/AppVersion-2.8.1-informational?style=flat-square)

A Helm chart for installing the docker-registry

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| cornfeedhobo | cornfeedhobo@fuzzlabs.org |  |

## Source Code

* <https://hub.docker.com/_/registry>

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://library-charts.k8s-at-home.com | common | 4.3.0 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| command | list | `["/bin/registry","serve","/etc/docker/registry/config.yml"]` | Override the command(s) for the default container |
| configMountPath | string | `"/etc/docker/registry"` |  |
| configSecretName | string | `""` | (Optional) Name of the manually created secret containing the [docker registry config file](https://docs.docker.com/registry/configuration/#list-of-configuration-options). If not provided, configmap must be populated. |
| configmap | object | See below | Configure configMaps for the chart here. Additional configMaps can be added by adding a dictionary key similar to the 'config' object. |
| configmap.config | object | `{"data":{"config.yml":"{{- tpl (toYaml .Values.service.main.config | nindent 2) $ }}\n"},"enabled":true}` | default config for docker-compose. this is only suitable for validation. Most deployments will need to create a dedicated config. |
| configmap.config.data | object | `{"config.yml":"{{- tpl (toYaml .Values.service.main.config | nindent 2) $ }}\n"}` | configMap data content. Helm template enabled. |
| configmap.config.enabled | bool | `true` | Enables or disables the configMap |
| controller.replicas | int | `2` | docker registry is stateless and we default to 2 replicas Large environments should consider the autoscale option. |
| controller.type | string | `"statefulset"` |  |
| image.pullPolicy | string | `"IfNotPresent"` | image pull policy |
| image.repository | string | `"docker.io/registry"` | image repository |
| image.tag | string | `""` | image tag, defaults to the chart's appVersion |
| imagePullSecrets | list | `[]` |  |
| ingress | object | See below | Configure the ingresses for the chart here. Additional ingresses can be added by adding a dictionary key similar to the 'main' ingress. |
| ingress.main.annotations | object | `{}` | Provide additional annotations which may be required. |
| ingress.main.enabled | bool | `false` | Enables or disables the ingress |
| ingress.main.hosts[0].host | string | `"docker-registry.local"` | Host address. Helm template can be passed. |
| podDisruptionBudget.enabled | bool | `true` |  |
| podDisruptionBudget.minAvailable | int | `1` |  |
| podSecurityContext | object | `{"fsGroup":1000,"runAsUser":1000}` | Configure the Security Context for the Pod |
| prometheus.enabled | bool | `false` | Enables or disables prometheus metrics |
| prometheus.forceServiceMonitor | bool | `false` | skip the check for ServiceMonitor CRD before creating |
| prometheus.interval | string | `"15s"` | Prometheus scrape interval |
| prometheus.path | string | `"/metrics"` | Prometheus metrics endpoint path |
| prometheus.port | int | `5001` | Prometheus metrics endpoint port |
| service | object | See below | Configure the services for the chart here. Additional services can be added by adding a dictionary key similar to the 'main' service. |
| service.main.ports | object | See below | Configure the Service port information here. Additional ports can be added by adding a dictionary key similar to the 'http' service. |
| service.main.ports.http.enabled | bool | `true` | Enables or disables the port |
| service.main.ports.http.port | int | `5000` | The port number |
| service.main.ports.http.primary | bool | `true` | Make this the primary port (used in probes, notes, etc...) If there is more than 1 service, make sure that only 1 port is marked as primary. |
| service.main.ports.http.protocol | string | `"HTTP"` | Port protocol. |

