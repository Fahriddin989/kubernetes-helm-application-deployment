{{- define "release-api.name" -}}
{{ .Chart.Name }}
{{- end }}

{{- define "release-api.fullname" -}}
{{ .Release.Name }}
{{- end }}

{{- define "release-api.labels" -}}
app.kubernetes.io/name: {{ include "release-api.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Values.env.APP_VERSION | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
helm.sh/chart: {{ .Chart.Name }}-{{ .Chart.Version }}
{{- end }}

{{- define "release-api.selectorLabels" -}}
app.kubernetes.io/name: {{ include "release-api.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
