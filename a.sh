#!/usr/bin/env bash

set -e

body='{
  "state": "success",
  "target_url": "https://github.com/borgified/travis_job0",
  "description": "The build failed!",
  "context": "continuous-integration/travis"
}'
#REPO="https://api.github.com/repos/borgified/travis_job1/statuses/$TRAVIS_PULL_REQUEST_SHA"
REPO="https://api.github.com/repos/borgified/travis_job0/statuses/86092ed0e2b6a5bd946ced7bd3754b99b28f15d3"

curl -s -X POST \
 -H "Content-Type: application/json" \
 -H "Accept: application/json" \
 -H "Authorization: token $TOKEN" \
 -d "$body" \
$REPO
