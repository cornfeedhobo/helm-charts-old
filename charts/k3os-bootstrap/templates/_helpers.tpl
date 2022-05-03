{{/*
Expand the name of the chart.
*/}}
{{- define "k3os-bootstrap.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "k3os-bootstrap.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "k3os-bootstrap.labels" -}}
helm.sh/chart: {{ include "k3os-bootstrap.chart" . }}
{{ include "k3os-bootstrap.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "k3os-bootstrap.selectorLabels" -}}
app.kubernetes.io/name: {{ include "k3os-bootstrap.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
