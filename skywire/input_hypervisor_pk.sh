#!/bin/bash

export PK
PK=$(jq -r '.public_key' ./hypervisor-config.json)
cat ./skywire-config.json | jq '.hypervisors[]=env.PK' >> test.json
rm ./skywire-config.json
mv ./test.json ./skywire-config.json
