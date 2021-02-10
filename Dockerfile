FROM alpine:3.11
RUN apt-get update
RUN apt-get install -y nginx
RUN echo "hello world"
