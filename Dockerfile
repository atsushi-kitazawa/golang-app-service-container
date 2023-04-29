FROM golang:1.19

WORKDIR /app

# download go module
COPY go.mod ./
RUN go mod download

# copy source code 
COPY *.go ./

# build
RUN CGO_ENABLED=0 GOOS=linux go build -o /main

EXPOSE 80

# run
CMD ["/main"]