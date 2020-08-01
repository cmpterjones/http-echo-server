FROM golang:1.14-alpine3.12 AS builder

COPY . /app

WORKDIR /app

RUN mkdir bin && go build -o bin/http-echo-server ./...

FROM alpine:3.12

COPY --from=builder /app/bin/ /bin/

EXPOSE 8080

CMD ["/bin/http-echo-server"]
