#!/bin/bash

echo "Name your nfs volume"
read -r NAME

ssh root@3gcf.s.time4vps.cloud "mkdir -p /store/$NAME && chown -R nfsnobody:nfsnobody /store/$NAME"

echo "Connecting to node0"..
ssh -p 2546 bresnow@vverkan00den.bresnow.design "docker volume create --driver local --name "$NAME" --opt type=nfs --opt device=:/store/"$NAME" --opt o=addr=3gcf.s.time4vps.cloud,rw,nolock"



echo "Connecting to node1"..
ssh -p 4669 bresnow@vverkan01den.bresnow.design  "docker volume create --driver local --name "$NAME" --opt type=nfs --opt device=:/store/"$NAME" --opt o=addr=3gcf.s.time4vps.cloud,rw,nolock"



echo "Connecting to node2"..
ssh -p 4669 bresnow@vverkan02den.bresnow.design "docker volume create --driver local --name "$NAME" --opt type=nfs --opt device=:/store/"$NAME" --opt o=addr=3gcf.s.time4vps.cloud,rw,nolock"



echo "Connecting to node3"..
ssh -p 4669 bresnow@vverkan03den.bresnow.design  "docker volume create --driver local --name "$NAME" --opt type=nfs --opt device=:/store/"$NAME" --opt o=addr=3gcf.s.time4vps.cloud,rw,nolock"