#!/bin/bash
cmdbv cmdbuploadv pgsqlv geov alfdatav bimv alfpgsqlv

mkdir -p /opt/cmdbuild/cmdbv

docker volume create --opt type=none --opt o=bind --opt device=/opt/cmdbuild/grafana-data grafana-data

docker service create \
    --mount 'type=volume,src=<VOLUME-NAME>,dst=<CONTAINER-PATH>,
      volume-driver=local,volume-opt=type=nfs,volume-opt=device=<nfs-server>:<nfs-path>,
      "volume-opt=o=addr=<nfs-address>,vers=4,soft,timeo=180,bg,tcp,rw"'
    --name myservice \
    <IMAGE>