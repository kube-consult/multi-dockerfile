FROM golang:alpine as base
RUN apk update --no-cache
RUN apk add git
ENV GO111MODULE=on
RUN mkdir /app
ADD . /app/
WORKDIR /app
RUN go build -o main  .
EXPOSE 8000
CMD ["./main"]

FROM alpine
RUN mkdir /app
COPY --from=base /app/main /app
WORKDIR /app
EXPOSE 8000
CMD ["./main"]


