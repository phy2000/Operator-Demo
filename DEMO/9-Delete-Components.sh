HELMDIR=~/WORK/Operator/helm
for COMPONENT in connectors schemaregistry controlcenter ksql replicator; do
    echo -n " $COMPONENT..."
    helm del --purge $COMPONENT
done
echo DONE
