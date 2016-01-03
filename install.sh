#!/usr/bin/env bash

# Install intemp from the internet
# Usage: install.sh [version]
# Alt Usage: curl -o- https://raw.githubusercontent.com/karlkfi/intemp/v1.0.0/install.sh | bash
# Requires: make, git

set -o errexit
set -o nounset
set -o pipefail

version=${1:-}

curl -o- https://raw.githubusercontent.com/karlkfi/intemp/master/intemp.sh | bash -s -- -t 'intemp' "
  version='${version:-}' &&
  git clone https://github.com/karlkfi/intemp . &&
  [ -z \"\${version}\" ] && version=\$(git describe --abbrev=0 --tags);
  git checkout \${version} &&
  make install
"
