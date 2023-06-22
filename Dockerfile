FROM golang:1.20

WORKDIR /usr/src/app

COPY . .

CMD ["go", "run", "main.go"]
