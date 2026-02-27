FROM golang:1.26

RUN apt-get install git
RUN git clone https://github.com/andrewbrdk/sqlm /app
RUN mkdir -p /app/logs
WORKDIR /app
RUN go get gosqlm
RUN go build
#todo: clean build

EXPOSE 8080

ENTRYPOINT ["/app/gosqlm"]
