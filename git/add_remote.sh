#!/bin/bash

# This script checks current directory and adds and updates the typical remotes needed for Skywire development if user invokes it from a Skywire directory.

DIR=$(basename $(PWD))

if [ $DIR = "dmsg" ]; then
  git remote add darkren https://github.com/Darkren/dmsg.git
  git remote add evan https://github.com/evanlinjin/dmsg.git
  git remote add nikita https://github.com/nkryuchkov/dmsg.git
  git remote update
elif [ $DIR = "skywire" ]; then
  git remote add darkren https://github.com/Darkren/skywire.git
  git remote add evan https://github.com/evanlinjin/skywire.git
  git remote add nikita https://github.com/nkryuchkov/skywire.git
  git remote add senyoret https://github.com/Senyoret1/skywire-mainnet.git
  git remote add taras https://github.com/taras-skycoin/skywire.git
  git remote update
else
      echo "Did not recognize the repo."
fi

