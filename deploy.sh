docker build -t rafal712/multi-client:latest -t rafal712/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t rafal712/multi-server:latest -t rafal712/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t rafal712/multi-worker:latest -t rafal712/multi-worker:$SHA -f ./worker/Dockerfile ./worker

docker push rafal712/multi-client:latest
docker push rafal712/multi-client:$SHA
docker push rafal712/multi-server:latest
docker push rafal712/multi-server:$SHA
docker push rafal712/multi-worker:latest
docker push rafal712/multi-worker:$SHA

kubectl apply -f k8s
kubectl set image deployments/client-deployment client=rafal712/multi-client:$SHA
kubectl set image deployments/server-deployment server=rafal712/multi-server:$SHA
kubectl set image deployments/worker-deployment worker=rafal712/multi-worker:$SHA