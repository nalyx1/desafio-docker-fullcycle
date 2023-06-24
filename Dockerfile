FROM golang:1.20 AS image

WORKDIR /usr/src/app

COPY go.mod ./
RUN go mod download && go mod verify

COPY . .
RUN go build -v -o /usr/local/bin/app ./...

CMD ["app"]

FROM scratch

COPY --from=image /usr/local/bin/app /
CMD ["/app"]
