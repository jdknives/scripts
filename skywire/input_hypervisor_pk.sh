#!/bin/bash

# Script fetches the PubKey of a local hypervisor and inputs it into the hypervisor field of a local skywire-visor config.
dddd
PK=$(jq -r '.public_key' ./hypervisor-config.json)
jq --arg pk $PK '.hypervisors[0]=$pk' ./skywire-config.json
