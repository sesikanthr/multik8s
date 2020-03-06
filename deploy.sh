docker build -t sesikanth/multi-client:latest -t sesikanth/multi-client:${SHA} -f ./client/Dockerfile ./client
docker build -t sesikanth/multi-worker:latest -t sesikanth/multi-worker:${SHA} -f ./worker/Dockerfile ./worker
docker build -t sesikanth/multi-server:latest -t sesikanth/multi-server:${SHA} -f ./server/Dockerfile ./server
docker push sesikanth/multi-client:latest
docker push sesikanth/multi-client:${SHA}
docker push sesikanth/multi-worker:latest
docker push sesikanth/multi-worker:${SHA}
docker push sesikanth/multi-server:latest
docker push sesikanth/multi-server:${SHA}
kubectl apply -f k8s
kubectl apply -f k8s/postgres-deployment
kubectl set image deployments/server-deployment server=sesikanth/multi-server:${SHA}
kubectl set image deployments/client-deployment client=sesikanth/multi-client:${SHA}
kubectl set image deployments/worker-deployment worker=sesikanth/multi-worker:${SHA}