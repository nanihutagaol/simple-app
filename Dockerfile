FROM openjdk:8-jdk-alpine
WORKDIR /app
RUN apk add docker
RUN apk add git
COPY build /app/build/
RUN chmod +rx /app/dockerfile/book-app/script.sh
ENTRYPOINT ["/bin/sh", "/app/dockerfile/book-app/script.sh"]