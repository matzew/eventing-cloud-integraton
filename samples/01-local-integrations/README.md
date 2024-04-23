# Local Camel-K source

## Create the Knative Broker

```
kubectl apply -f 000-broker.yaml
```

## Connect some Kamelets to the Knative broker

```
kubectl apply -f 011-kamelet.yaml
```

> Note: This is taking some time on the _FIRST_ apply, since some Maven/Quarkus builds are executed.

## Deploy a consumer function to receiving events

```
kubectl apply -f 020-consumer-function.yaml
```

## Connect the Kamelet events to the function

```
kubectl apply -f 030-trigger.yaml
```
