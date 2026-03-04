FROM golang:1.26

RUN apt-get update && apt-get install -y git pgformatter
RUN git clone https://github.com/andrewbrdk/queryagent /app
RUN mkdir -p /app/logs
WORKDIR /app
RUN go get queryagent
RUN go build
#todo: clean build

EXPOSE 8080

ENTRYPOINT ["/app/queryagent"]
