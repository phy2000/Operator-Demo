#!/bin/bash
POD=kafka-0
if [ $# -ge 1 ] ; then
    POD=$1
fi
# Must provide pod name
echo Opening shell on POD %POD
kubectl -n operator exec -it $POD /bin/sh
