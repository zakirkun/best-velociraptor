#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://api.stackbit.com/project/5e8c62748a53180014e5b0a1/webhook/build/pull > /dev/null
npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://api.stackbit.com/pull/5e8c62748a53180014e5b0a1
curl -s -X POST https://api.stackbit.com/project/5e8c62748a53180014e5b0a1/webhook/build/ssgbuild > /dev/null
gatsby build
curl -s -X POST https://api.stackbit.com/project/5e8c62748a53180014e5b0a1/webhook/build/publish > /dev/null
