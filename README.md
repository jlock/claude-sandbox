# claude-sandbox

Runs Claude Code inside a Docker container (via Cursor Dev Containers) so it
can only see the project folder it's opened in, not the rest of the machine.

1. Build the shared image (rerun to update Claude): `./build.sh`
2. Add a project: `./add-to-project.sh ~/src/some-project`
3. In Cursor: Cmd+Shift+P → **Dev Containers: Reopen in Container**, then run `claude` and log in.

The login lives in the `claude-config` Docker volume and is shared by all projects.
