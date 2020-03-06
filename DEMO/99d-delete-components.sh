#!/bin/bash
for name in replicator controlcenter ksql connectors schemaregistry kafka zookeeper; do
    echo Deleting $name
    helm del $name --namespace operator
    sleep 1
done
