#!/usr/bin/env bash

set -e

body=$(cat <<EOF
{
  "state": "$STATE",
  "target_url": "https://travis-ci.com/$TRAVIS_REPO_SLUG/builds/$TRAVIS_BUILD_ID",
  "description": "The build is $STATE!",
  "context": "$TRAVIS_REPO_SLUG"
}
EOF
)

REPO="https://api.github.com/repos/$UPSTREAM_REPO/statuses/$UPSTREAM_SHA"

curl -s -X POST \
 -H "Content-Type: application/json" \
 -H "Accept: application/json" \
 -H "Authorization: token $GITHUB_TOKEN" \
 -d "$body" \
$REPO
