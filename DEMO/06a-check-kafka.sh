kubectl get kafka -n operator | grep kafka
kubectl describe kafka kafka -n operator
kubectl get kafka kafka -ojson -n operator
kubectl get kafka kafka -ojsonpath='{.status.phase}' -n operator; echo
kubectl get pods -n operator
kubectl  -n operator  get kafka kafka -ojsonpath='{.status.internalClient}' | tee kafka.properties
kubectl -n operator get kafka kafka -ojsonpath='{.status.bootstrapEndpoint}' | tee bootstrap.txt
echo
kubectl -n operator get kafka kafka -ojsonpath='{.status.replicationFactor}' | tee replication.txt
echo
kubectl -n operator get kafka kafka -ojsonpath='{.status.zookeeperConnect}' | tee zookeeper.txt
echo
