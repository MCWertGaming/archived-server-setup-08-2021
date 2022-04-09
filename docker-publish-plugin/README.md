# docker-publish-plugin

[![Build Status](https://drone.leven.dev/api/badges/mcwertgaming/docker-publish-plugin/status.svg?ref=refs/heads/main)](https://drone.leven.dev/mcwertgaming/docker-publish-plugin)

A custom Drone plugin for the private leven.dev infrastructure. Automates the process of pushing docker containers into the leven.dev docker repositories and docker hub!

Available here:
```
docker.nexus.leven.dev/infrastructure/docker-publish-plugin:latest
```

## Usage (nexus.leven.dev)

This plugin is completely automated, so you just need to provide your user name, password and the remote repository. Here is an example task:

```yml
kind: pipeline
name: default
type: docker

  - name: build
    image: docker-private.nexus.local.leven.dev/infrastructure/docker-publish-plugin:latest
    environment:
      USERNAME:
        from_secret: <username_secret>
      PASSWORD:
        from_secret: <password_secret>
      REPOSITORY: docker-push.nexus.local.leven.dev/<YOUR>/<REPO>:<TAG>
    privileged: true
    volumes:
      - name: docker_socket
        path: /var/run/docker.sock

volumes:
  - name: docker_socket
    host:
      path: /var/run/docker.sock
```

## Usage (hub.docker.com)

Here is the same example for dockerhub:

> EXPERIMENTAL AND NOT YET IMPLEMENTED

```yml
kind: pipeline
name: default
type: docker

  - name: build
    image: docker-private.nexus.local.leven.dev/infrastructure/docker-publish-plugin:latest
    environment:
      USERNAME:
        from_secret: <username_secret>
      PASSWORD:
        from_secret: <password_secret>
      REPOSITORY: <dockerhub>
    privileged: true
    volumes:
      - name: docker_socket
        path: /var/run/docker.sock

volumes:
  - name: docker_socket
    host:
      path: /var/run/docker.sock
```
