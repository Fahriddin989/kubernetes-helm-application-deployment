#!/usr/bin/env bash
set -euo pipefail

echo "== Context =="
kubectl config current-context

echo
echo "== Nodes =="
kubectl get nodes -o wide

echo
echo "== System pods =="
kubectl get pods -n kube-system
