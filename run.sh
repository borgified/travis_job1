#!/usr/bin/env bash

set -e

body='{ "request": { "message": "Override the commit message: this is an api request", "branch":"master", "config": { "env": "MYVAR=new_var_from_job1" } }}'
REPO='https://api.travis-ci.org/repo/borgified%2Ftravis_job0/requests'


curl -s -X POST \
 -H "Content-Type: application/json" \
 -H "Accept: application/json" \
 -H "Travis-API-Version: 3" \
 -H "Authorization: token $TOKEN" \
 -d "$body" \
$REPO
