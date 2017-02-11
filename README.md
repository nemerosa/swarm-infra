# Swarm Infra

Infrastructure definition for Nemerosa.

## Dependencies

* `service-proxy`
* `service-monitoring`

## Prerequisites

Network creation:

```bash
docker network create -d overlay proxy
```

## Ontrack stack

On a swarm master node, run:

```bash
docker stack deploy --compose-file docker-compose-ontrack.yml ontrack
```

## Testing locally

First, create a local swarm:

```bash
for i in 1 2 3; do
  docker-machine create -d virtualbox --engine-opt experimental=true node-$i
done

eval $(docker-machine env node-1)

docker swarm init \
  --advertise-addr $(docker-machine ip node-1)

TOKEN=$(docker swarm join-token -q worker)

for i in 2 3; do
  eval $(docker-machine env node-$i)

  docker swarm join \
    --token $TOKEN \
    --advertise-addr $(docker-machine ip node-$i) \
    $(docker-machine ip node-1):2377
done

eval $(docker-machine env node-1)

docker node ls
```

Then:

```bash
eval $(docker-machine env node-1)
export ONTRACK_DOMAIN_NAME=ontrack.${docker-machine ip node-1}.xip.io
docker stack deploy --compose-file docker-compose-ontrack.yml ontrack
```
