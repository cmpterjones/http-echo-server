all:
	go build -o bin/http-echo-server ./...

.PHONY: docker
docker:
	docker build -t http-echo-server:$(shell git rev-parse HEAD | cut -c1-10) ./

.PHONY: clean
clean:
	rm -rf bin

.PHONY: run
run: docker
	docker run -d -p "8080:8080" http-echo-server:$(shell git rev-parse HEAD | cut -c1-10)
