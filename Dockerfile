FROM openjdk:8-jdk-alpine
WORKDIR /app
COPY gradlew .
COPY gradle gradle
COPY build.gradle settings.gradle ./
COPY ./library /app/library
COPY ./book-application /app/book-application
COPY ./hello-application /app/hello-application

RUN ./gradlew :book-application:build
ENTRYPOINT ["java", "-jar","book-application/build/libs/book-application-0.0.1-SNAPSHOT.jar"]
