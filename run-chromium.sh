#!/bin/bash
#
# Build the extension and run a chromium extension with it installed.
#
set -o errexit -o xtrace

cd $(dirname $0)
source locate-gnu-utils.sh
source makecrx.sh
PROFILE_DIRECTORY="$("$MKTEMP" -d)"
trap 'rm -r "$PROFILE_DIRECTORY"' EXIT
chromium-browser \
  --user-data-dir="$PROFILE_DIRECTORY" \
  --load-extension=pkg/crx/ "$@"
