#!/bin/bash
#This script checks if the current directory is a git repository. 
#If it is, the script will check recently opened and closed PRs 
#and add the repositories of the PR authors as remotes to the local
#git repository. The script currently assumes the local repositiory 
#was cloned via http. SSH repositories are not supported. 

repo_pulls_url=$(git config --get remote.origin.url)
repo_closed_pulls_url="$repo_pulls_url/pulls?q=is%3Apr+is%3Aclosed"

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