# Camel-K Event Producers and Consumers with Knative Broker

## Create the Knative Broker

```
kubectl apply -f 000-broker.yaml
```

## Connect a Kamelet to produce events to the Knative broker

```
kubectl apply -f 011-kamelet-producer.yaml
```

> Note: This is taking some time on the _FIRST_ apply, since some Maven/Quarkus builds are executed.

## Deploy a consumer Pipe to receiving events

```
kubectl apply -f 012-kamelet-consumer.yaml
```

> Note: This will actually create a trigger for the referenced sink of the Pipe.
