#!/usr/bin/env bash
set -euo pipefail

RELEASE="${RELEASE:-release-api}"
NAMESPACE="${NAMESPACE:-release-api-dev}"
CHART_PATH="${CHART_PATH:-charts/release-api}"
VALUES_FILE="${VALUES_FILE:-charts/release-api/values-dev.yaml}"

kubectl get namespace "$NAMESPACE" >/dev/null 2>&1 || kubectl create namespace "$NAMESPACE"

helm upgrade --install "$RELEASE" "$CHART_PATH" \
  -n "$NAMESPACE" \
  -f "$VALUES_FILE" \
  --wait \
  --timeout 2m
