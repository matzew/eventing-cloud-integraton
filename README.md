# Knative Eventing and Apache Camel-K Integrations

A demo on Apache Camel-K integrations with Knative Eventing

## Requirements

You need to have a few commands installed on your machine:
* `kubectl`
* `minikube`
* `helm`

### Helm

For `helm`, on the first invocation (if not done before) register the repository:

```bash
helm repo add camel-k https://apache.github.io/camel-k/charts/
```

## Installation

The `system` folder has a few script to install Apache Camel-K and Knative Eventing.

shortcut:

```
./system/00-installer.sh && ./system/01-camel-k.sh && ./system/02-kn-eventing.sh 
```

## Integration Samples

more...
