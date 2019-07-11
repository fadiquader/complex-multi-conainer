docker build -t fadiqua/multi-client:latest -t fadiqua/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t fadiqua/multi-server:latest -t fadiqua/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t fadiqua/multi-worker:latest -t fadiqua/multi-worker:$SHA -f ./worker/Dockerfile ./worker

docker push fadiqua/multi-client:latest
docker push fadiqua/multi-server:latest
docker push fadiqua/multi-worker:latest

docker push fadiqua/multi-client:$SHA
docker push fadiqua/multi-server:$SHA
docker push fadiqua/multi-worker:$SHA

kubectl apply -f k8s
kubectl set image deployments/server-deployment server=fadiqua/multi-server:$SHA
kubectl set image deployments/client-deployment client=fadiqua/multi-client:$SHA
kubectl set image deployments/worker-deployment worker=fadiqua/multi-worker:$SHA
