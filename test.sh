#!/bin/bash

reg="^## ([^\.[:space:]]+)(\.\.\.([^[:space:]]+)( \[(ahead ([0-9]+))?(, )?(behind ([0-9]+))?(.+)?\])?)?$"

declare -a tests=(
    "## master"
    "## master...origin/master"
    "## master...origin/master [ahead 1]"
    "## master...origin/master [behind 2]"
    "## master...origin/master [ahead 3, behind 4]"
    "## master...origin/master [ahead 3, behind 4, gnarf 5]"
)

for t in "${tests[@]}"; do
    echo "TEST $t"
    if [[ "$t" =~ $reg ]]; then
	let i=0
	for entry in "${BASH_REMATCH[@]}"; do
	    echo "$i $entry"
	    let i=i+1
	done
    fi
    echo
done
