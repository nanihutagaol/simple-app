FROM openjdk:8-jdk-alpine
WORKDIR /app
RUN apk update && apk --no-cache add \
    docker \
    git
RUN git clone -b docker-compose-with-db https://github.com/nanihutagaol/simple-app.git
WORKDIR /app/simple-app
COPY ./script.sh ./
RUN chmod +rx /app/simple-app/script.sh
ENTRYPOINT ["/bin/sh", "/app/simple-app/script.sh"]