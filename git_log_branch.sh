#!/bin/bash

log_branch(){
	commit_list=$(git log --pretty="%H" $@)
	for commit_hash in $commit_list;do
		show=$(git show $commit_hash)
	 	branches=$(git branch --column --contain $commit_hash | sed -e 's/* /*/' -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')
	 	output=$(echo "$show" | sed "s@$commit_hash@$commit_hash {$branches}@")
	 	echo "$output"
	done
}

log_branch $@