docker network create concourse-net

docker pull postgres
docker run --name concourse-db \
  --net=concourse-net \
  -h concourse-postgres \
  -p 5432:5432 \
  -e POSTGRES_USER=ajit \
  -e POSTGRES_PASSWORD=test1234 \
  -e POSTGRES_DB=atc \
  -d postgres

docker pull concourse/concourse
docker run  --name concourse \
  -h concourse \
  -p 8080:8080 \
  --detach \
  --privileged \
  --net=concourse-net \
  concourse/concourse quickstart \
  --add-local-user=ajit:test1234 \
  --main-team-local-user=ajit \
  --external-url=http://10.27.79.147:8080 \
  --postgres-user=ajit \
  --postgres-password=test1234 \
  --postgres-host=concourse-db \
  --worker-garden-dns-server 8.8.8.8
