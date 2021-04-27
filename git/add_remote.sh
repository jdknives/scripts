#!/bin/bash

# This script checks current directory and adds and updates the typical remotes needed for Skywire development if user invokes it from a Skywire directory.

DIR=$(basename $(pwd))

if [ $DIR = "dmsg" ]; then
  git remote add darkren https://github.com/Darkren/dmsg.git
  git remote add evan https://github.com/evanlinjin/dmsg.git
  git remote add frank https://github.com/i-hate-nicknames/dmsg.git
  git remote add rudi https://github.com/jdknives/dmsg.git
  git remote update
elif [ $DIR = "skywire" ]; then
  git remote add darkren https://github.com/Darkren/skywire.git
  git remote add evan https://github.com/evanlinjin/skywire.git
  git remote add senyoret https://github.com/Senyoret1/skywire-mainnet.git
  git remote add frank https://github.com/i-hate-nicknames/skywire.git
  git remote add rudi https://github.com/jdknives/skywire.git
  git remote update
elif [ $DIR = "skybian" ]; then
  git remote add rudi https://github.com/jdknives/skybian.git
  git remote add frank https://github.com/i-hate-nicknames/skybian.git
  git remote add asxtree https://github.com/asxtree/skybian.git
  git remote update
else
      echo "Did not recognize the repo."
fi

