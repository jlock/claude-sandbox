# Shared image for running Claude Code in a sandbox. Used by every project's
# .devcontainer/devcontainer.json via "image": "claude-sandbox:latest".
FROM node:20-bookworm

RUN apt-get update && apt-get install -y --no-install-recommends \
      git curl ca-certificates ripgrep less jq unzip ruby \
    && rm -rf /var/lib/apt/lists/*

USER node
ENV CLAUDE_CONFIG_DIR=/home/node/.claude
# Created here so the shared volume mounted on top is owned by the node user
RUN mkdir -p /home/node/.claude
RUN curl -fsSL https://claude.ai/install.sh | bash
ENV PATH="/home/node/.local/bin:${PATH}"
