# homebrew-tap

## Installing kettle with brew

You can install `kettle` using `brew` and this tap.

```bash
❯ brew tap nlathia/tap
❯ brew install kettle-cli

# You can see that this works by running
❯ kettle version
```

## Updating a release

1. Create a release in the Github repo (using the UI)

2. Run `brew create <URL>` with the URL to the tar file of the release

3. Update the Formula file with the URL and SHA
