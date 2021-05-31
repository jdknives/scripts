#!/bin/bash
#This script checks if the current directory is a git repository.
#If it is, it grabs all remotes of developers with open PR to the repo
#and adds them as remotes. 

current_dir=${PWD##*/}
repo_pulls_url="https://github.com/skycoin/$current_dir/pulls"
repo_closed_pulls_url="https://github.com/skycoin/$current_dir/pulls?q=is%3Apr+is%3Aclosed"

IFS="
"

if ! git rev-parse --git-dir > /dev/null 2>&1; then
    echo "Not inside a git repo. Aborting."
    exit
fi

devsArray=($(curl $repo_pulls_url | grep -Po '(?<=created\sby\s)[^"]*' ))

devsArray=($(curl $repo_closed_pulls_url | grep -Po '(?<=opened\sby\s)[^"]*' ))

devsArray=( `for i in ${devsArray[@]}; do echo $i; done | sort -u` )

remoteArray=($(git remote))

for i in "${devsArray[@]}"
do
    if [[ ! " ${remoteArray[@]} " =~ " ${i} " ]]; then
    git remote add $i "https://github.com/$i/$current_dir.git"
    fi
done



git remote update