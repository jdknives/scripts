#!/bin/bash

DIR=$(basename $(PWD))

if [ $DIR = "dmsg" ]; then
  git remote add darkren https://github.com/Darkren/dmsg-1.git
  git remote add evan https://github.com/evanlinjin/dmsg-1.git
  git remote add nikita https://github.com/nkryuchkov/dmsg-1.git
  git remote update
elif [ $DIR = "skywire-mainnet" ]; then
  git remote add darkren https://github.com/Darkren/skywire-mainnet.git
  git remote add evan https://github.com/SkycoinProject/skywire-mainnet.git
  git remote add nikita https://github.com/nkryuchkov/skywire-mainnet.git
  git remote add senyoret https://github.com/Senyoret1/skywire-mainnet.git
  git remote update
else
      echo "Did not recognize the repo."
fi

