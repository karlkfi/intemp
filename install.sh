#!/usr/bin/env bash

# Install intemp from the internet
# Usage: curl -o- https://raw.githubusercontent.com/karlkfi/intemp/v1.0.0/install.sh | bash
# Requires: make, git

set -o errexit
set -o nounset
set -o pipefail

version=${1:-}

function install {
  local version=${1:-}
  git clone https://github.com/karlkfi/intemp .
  if [ -z "version" ]; then
    version=$(git describe --abbrev=0 --tags)
  fi
  git checkout ${version}
  make install
}

curl -o- https://raw.githubusercontent.com/karlkfi/intemp/master/intemp.sh | bash -- -o 'intemp' install ${version}
