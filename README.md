# HTTP-echo-server

Simple, lightweight echo-server that simply repeats what it gets, or just responds however configured.

## Build

Use the provided Makefile, executable will be placed at `bin/http-echo-server`.

### Docker build

`make docker` will build and tag `http-echo-server:GIT_SHA` which can be run with docker.

A compose file is provided that will handle this as well: `docker-compose build http-echo-server`

### Run

`docker run -d -p "8080:8080" cmpterjones/http-echo-server:v0.0.1`
`docker-compose up -d` (will build into a docker image and run that, basically as above
