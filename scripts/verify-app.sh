#!/usr/bin/env bash
set -euo pipefail

NAMESPACE="${NAMESPACE:-release-api-dev}"
SERVICE_NAME="${SERVICE_NAME:-release-api}"

echo "== Helm release =="
helm list -n "$NAMESPACE"

echo
echo "== Kubernetes resources =="
kubectl -n "$NAMESPACE" get deploy,svc,pods -o wide

echo
echo "== App health through Service =="
kubectl -n "$NAMESPACE" run curl-verify-app \
  --image=curlimages/curl:8.10.1 \
  --restart=Never \
  --rm -i -- \
  sh -c "
    echo 'GET /health'
    curl -sS http://$SERVICE_NAME/health
    echo
    echo 'GET /ready'
    curl -sS http://$SERVICE_NAME/ready
    echo
    echo 'GET /'
    curl -sS http://$SERVICE_NAME/
    echo
  "
