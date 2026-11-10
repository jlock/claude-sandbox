#!/bin/sh
# Usage: ./add-to-project.sh ~/src/some-project
# Adds a .devcontainer/devcontainer.json that runs the project in the shared
# claude-sandbox image. Only that project folder is visible inside the container.
set -e
dir="${1:?usage: $0 <project-folder>}"
name="$(basename "$(cd "$dir" && pwd)")"
mkdir -p "$dir/.devcontainer"
if [ -e "$dir/.devcontainer/devcontainer.json" ]; then
  echo "$dir/.devcontainer/devcontainer.json already exists, leaving it alone" >&2
  exit 1
fi
cat > "$dir/.devcontainer/devcontainer.json" <<JSON
{
  "name": "$name (claude sandbox)",
  "image": "claude-sandbox:latest",
  "remoteUser": "node",
  "mounts": [
    "source=claude-config,target=/home/node/.claude,type=volume"
  ],
  "containerEnv": { "CLAUDE_CONFIG_DIR": "/home/node/.claude" },
  "customizations": {
    "vscode": { "extensions": ["anthropic.claude-code"] }
  }
}
JSON
echo "Added $dir/.devcontainer/devcontainer.json"
