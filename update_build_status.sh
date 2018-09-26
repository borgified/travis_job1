#!/usr/bin/env bash

set -e

read -r -d '' body <<EOF
{
  "state": "pending",
  "target_url": "https://github.com/borgified/travis_job1/builds/$TRAVIS_BUILD_ID",
  "description": "The build is pending!",
  "context": "continuous-integration/travis"
}
EOF

REPO="https://api.github.com/repos/$UPSTREAM_REPO/statuses/$UPSTREAM_SHA"

curl -s -X POST \
 -H "Content-Type: application/json" \
 -H "Accept: application/json" \
 -H "Authorization: token $GITHUB_TOKEN" \
 -d "$body" \
$REPO
