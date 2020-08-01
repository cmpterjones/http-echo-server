all:
	go build -o bin/http-echo-server ./...

.PHONY: docker
docker:
	docker build -t http-echo-server:$(shell git rev-parse HEAD | cut -c1-12) ./

.PHONY: clean
clean:
	rm -rf bin
