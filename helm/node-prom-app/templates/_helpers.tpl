{{/* Return chart name */}}
{{- define "node-prom-app.name" -}}
{{- if .Values.nameOverride }}
{{- .Values.nameOverride | trunc 63 | trimSuffix "-" | lower -}}
{{- else -}}
node-prom-app
{{- end -}}
{{- end }}

{{/* Return full name (release + chart) */}}
{{- define "node-prom-app.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" | lower -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name (include "node-prom-app.name" .) | trunc 63 | trimSuffix "-" | lower -}}
{{- end -}}
{{- end }}

{{/* Common labels */}}
{{- define "node-prom-app.labels" -}}
app.kubernetes.io/name: {{ include "node-prom-app.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/* Selector labels */}}
{{- define "node-prom-app.selectorLabels" -}}
app.kubernetes.io/name: {{ include "node-prom-app.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/* ServiceAccount name */}}
{{- define "node-prom-app.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "node-prom-app.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end -}}
{{- end }}
