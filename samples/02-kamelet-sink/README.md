# Apache Camel-K Event Consumer with Knative Broker

## Create the Knative Broker

```
kubectl apply -f 000-broker.yaml
```

## Connect source to the Knative broker

```
kubectl apply -f 011-ping-source.yaml
```

## Deploy a consumer Pipe to receiving events

```
kubectl apply -f 012-kamelet-consumer.yaml
```

> Note: This will actually create a trigger for the referenced sink of the Pipe.
