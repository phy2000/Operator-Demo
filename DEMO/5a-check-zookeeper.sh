kubectl get zookeeper -n operator | grep zookeeper
kubectl describe zookeeper zookeeper -n operator
kubectl get zookeeper zookeeper -ojson -n operator
kubectl get zookeeper zookeeper -ojsonpath='{.status.phase}' -n operator
