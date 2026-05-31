#!/usr/bin/env bash
set -euo pipefail

RELEASE="${RELEASE:-release-api}"
NAMESPACE="${NAMESPACE:-release-api-dev}"
REVISION="${REVISION:?Usage: REVISION=<revision> ./scripts/helm-rollback.sh}"

helm rollback "$RELEASE" "$REVISION" \
  -n "$NAMESPACE" \
  --wait \
  --timeout 2m
