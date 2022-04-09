# git clone plugin

[![Build Status](https://drone.leven.dev/api/badges/mcwertgaming/git-clone-plugin/status.svg?ref=refs/heads/main)](https://drone.leven.dev/mcwertgaming/git-clone-plugin)

This docker container automatically pulls your project and checks out the git commit your task is running in. Fully automated and trusts leven.dev by default!

## Usage

You can simply use this in your workflow:

```yml
---
kind: pipeline
type: docker
name: <name>

platform:
  os: linux
  arch: amd64

# required because the default pull action does not trust the leven.dev ca
clone:
  disable: true

steps:
- name: clone
  pull: always
  image: docker-private.nexus.local.leven.dev/infrastructure/git-clone-plugin:latest
  environment:
    REPOSITORY: https://gitea.leven.dev/<username>/<repository>.git
...
```
