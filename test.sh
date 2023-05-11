#!/bin/bash

mkdir -p changelog


for i in {1..5}; do
    random_string=$(openssl rand -base64 50 | tr -dc 'a-zA-Z0-9' )
    touch "changelog/$i.yaml"
    cat << EOF > "changelog/$i.yaml"
pr: $i
message: $random_string
type: feat
issue:
EOF
    git add "changelog/$i.yaml" > /dev/null 2>&1
    git commit -m "add changelog $i.yaml"
    git rm "changelog/$i.yaml" > /dev/null 2>&1
    git commit -m "delete changelog $i.yaml"
done
