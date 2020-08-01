# HTTP-echo-server

Simple, lightweight echo-server that simply repeats what it gets, or just responds however configured.

## Build

Use the provided Makefile, executable will be placed at `bin/http-echo-server`.

### Docker build

`make docker` will build and tag `http-echo-server:GIT_SHA` which can be run with docker.

A compose file is provided that will handle this as well: `docker-compose build http-echo-server`

### Run

`docker run -d -p "8080:8080" cmpterjones/http-echo-server:v0.0.1` (if this is published ¯\\\_(ツ)_/¯)

`docker-compose up -d` will run using docker-compose. Note that if you make changes you should run `docker-compose build http-echo-server` again to make sure it updates.

There's a make target to build and run by simply `make run` from the root of the repository. It binds to 8080 on the host machine and builds/tags as `http-echo-server:10-char-git-sha`.
