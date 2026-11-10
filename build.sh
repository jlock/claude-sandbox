#!/bin/sh
# Build (or rebuild, to update Claude) the shared sandbox image.
set -e
cd "$(dirname "$0")"
docker build --pull -t claude-sandbox:latest .
