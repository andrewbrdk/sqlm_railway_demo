FROM node:25-alpine AS frontend
WORKDIR /app
RUN apk add --no-cache git
RUN git clone https://github.com/andrewbrdk/queryagent /app
RUN npm install
RUN npm run build

FROM golang:1.26 AS backend
RUN apt-get update && apt-get install -y --no-install-recommends pgformatter \
    && rm -rf /var/lib/apt/lists/*
WORKDIR /app
COPY --from=frontend /app /app
RUN mkdir -p /app/logs
RUN go get queryagent
RUN go build
#todo: clean
EXPOSE 8080
ENTRYPOINT ["/app/queryagent"]
