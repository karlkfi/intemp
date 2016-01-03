#!/usr/bin/env bash

# Runs the supplied command string in a temporary workspace directory.
# Usage: intemp.sh [-t prefix] <command> [arg1 [arg2...]]
# Requires: mktemp

set -o errexit
set -o nounset
set -o pipefail

opt_flag=${1:-}
[ -z "${opt_flag}" ] && echo "No command supplied" >&2 && exit 1

if [ "${opt_flag}" == "-o" ]; then
  shift
  prefix=${1:-}
  [ -z "${prefix}" ] && echo "No prefix supplied" >&2 && exit 1
  shift
fi

cmd="$@"
[ -z "${cmd}" ] && echo "No command supplied" >&2 && exit 1

workspace=$(mktemp -d "${TMPDIR}/${prefix}.XXXXXX")
echo "Workspace created: ${workspace}" 1>&2

cleanup() {
  local -r workspace="$1"
  rm -rf "${workspace}"
  echo "Workspace deleted: ${workspace}" 1>&2
}
trap "cleanup '${workspace}'" EXIT

pushd "${workspace}" > /dev/null
${cmd}
popd > /dev/null

trap - EXIT
cleanup "${workspace}"
