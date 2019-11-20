POD=kafka-0
if [ $# -ge 1 ] ; then
    POD=$1
fi
# Must provide pod name
kubectl -n operator exec -it $POD bash
