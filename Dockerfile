FROM openjdk:8-jdk-alpine
WORKDIR /app
RUN apk add docker
RUN apk add git
COPY ./book-script.sh ./
RUN chmod +rx /app/book-script.sh
ENTRYPOINT ["/bin/sh", "/app/book-script.sh"]