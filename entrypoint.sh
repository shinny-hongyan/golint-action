#!/bin/sh -l

cd $GITHUB_WORKSPACE

GOLINT_OUTPUT="$(go list $1/... | grep -v /vendor/ | xargs -L1 golint -set_exit_status)"

if [ $? -ne 0 ]; then
  echo "${GOLINT_OUTPUT}"

  exit 1
fi

echo "::set-output name=golint-output::Golint step succeed"
