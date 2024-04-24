#!/usr/bin/env bash

set -e

# Turn colors in this script off by setting the NO_COLOR variable in your
# environment to any value:
#
# $ NO_COLOR=1 test.sh
NO_COLOR=${NO_COLOR:-""}
if [ -z "$NO_COLOR" ]; then
  header=$'\e[1;33m'
  reset=$'\e[0m'
else
  header=''
  reset=''
fi

function header_text {
  echo "$header$*$reset"
}

header_text "Setting up Apache Camel-K"

export REGISTRY_ADDRESS=$(kubectl -n kube-system get service registry -o jsonpath='{.spec.clusterIP}')
helm install \
  --generate-name \
  --set platform.build.registry.address=${REGISTRY_ADDRESS} \
  --set platform.build.registry.insecure=true \
  camel-k/camel-k

sleep 5; while echo && kubectl get pods -n default | grep -v -E "(Running|Completed|STATUS)"; do sleep 5; done

kubectl get pods -n default

header_text "Patch until 2.3.1 is out"

kubectl get role camel-k-operator -n default -o json | \
jq '(.rules[] | select(.apiGroups[] == "eventing.knative.dev" and .resources[] == "triggers").resources) += ["brokers"]' | \
kubectl apply -f -
